import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:non_steam_artwork/core/steam/steam_cache.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/core/steam/steam_shortcuts.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';
import 'package:non_steam_artwork/src/rust/api/simple.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

export 'package:non_steam_artwork/src/rust/api/simple.dart' show SteamShortcut;

class SteamManager {
  SteamManager({
    this.steamShortcuts = const SteamShortcuts(),
    required this.logger,
  });

  final SteamShortcuts steamShortcuts;
  final Logger logger;

  var _cachedArtwork = <CacheProgramArtwork>[];
  var _shortcutPrograms = <SteamShortcut>[];
  String? _userSteamDir;

  Future<void> init() async {
    await steamShortcuts.init();
    _userSteamDir = await _getUserSteamDir();
  }

  String get _shortcutPath {
    if (_userSteamDir == null) {
      throw const SteamUserFolderNotFoundException();
    }

    return path.join(_userSteamDir!, 'config', 'shortcuts.vdf');
  }

  String get _gridPath {
    if (_userSteamDir == null) {
      throw const SteamUserFolderNotFoundException();
    }

    return path.join(_userSteamDir!, 'config', 'grid');
  }

  String get gridPath => _gridPath;

  Future<String?> _getUserSteamDir() async {
    final userPath = switch (defaultTargetPlatform) {
      TargetPlatform.linux => '/home/deck/.steam/steam/userdata/',
      _ => path.join((await getDownloadsDirectory())!.path, '_steam'),
    };

    final userDir = Directory(userPath);
    if (await userDir.exists()) {
      final subDirs = (await userDir.list().toList()).whereType<Directory>();
      if (subDirs.isNotEmpty) {
        if (subDirs.length > 1) {
          logger.log('Found multiple users: ${subDirs.map((e) => path.basename(e.path))}, selecting first user.');
        }

        // in case there are multiple users, first is chosen
        return subDirs.first.path;
      } else {
        logger.log('No users found at ${userDir.path}.');
      }
    } else {
      logger.log('Directory ${userDir.path} does not exist.');
    }

    return null;
  }

  Future<Iterable<File>> determineUnusedCache() async {
    await _getCache();

    try {
      _shortcutPrograms = await getShortcuts();
      return _determineUnusedCache();
    } catch (_) {}

    return [];
  }

  Future<void> _getCache() async {
    final gridPath = _gridPath;
    if (await Directory(gridPath).exists()) {
      _cachedArtwork = await SteamGridCache(gridPath).getCacheArtwork();
    }
  }

  Future<Iterable<File>> _determineUnusedCache() async {
    final shortcutGameIds = _shortcutPrograms.map((e) => e.appId);
    final unused = _cachedArtwork.where((element) => !shortcutGameIds.contains(element.id));

    return unused.fold(
        [],
        (previousValue, element) => [
              ...previousValue,
              element.icon,
              element.cover,
              element.background,
              element.logo,
              element.hero,
            ]).whereType<File>();
  }

  Future<Iterable<SteamProgram>> getPrograms(Iterable<SteamProgramType> validTypes) async {
    await _getCache();

    try {
      _shortcutPrograms = await getShortcuts();

      return _shortcutPrograms.map((program) {
        final cachedItem = _cachedArtwork.firstWhereOrNull((item) => item.id == program.appId);
        final programType = program.toType();

        if (validTypes.contains(programType)) {
          return SteamProgram(
            appId: program.appId,
            appName: program.appName,
            programType: programType,
            icon: cachedItem?.icon,
            cover: cachedItem?.cover,
            background: cachedItem?.background,
            logo: cachedItem?.logo,
            hero: cachedItem?.hero,
          );
        }
        return null;
      }).whereType<SteamProgram>();
    } catch (_) {}

    return [];
  }

  Future<List<SteamShortcut>> getShortcuts() async {
    final shortcutsPath = _shortcutPath;
    if (await File(shortcutsPath).exists()) {
      try {
        return steamShortcuts.getShortcuts(shortcutsPath);
      } catch (_) {
        throw const SteamShortcutsFileCannotBeParsedException();
      }
    }

    throw const SteamShortcutsFileNotFoundException();
  }

  Future<(String, String)> generateArtworkPath({
    required int appId,
    required SteamGridArtType artType,
  }) async {
    final gridPath = _gridPath;

    // TODO: error check folder exists

    final filename = switch (artType) {
      SteamGridArtType.icon => '${appId}_icon',
      SteamGridArtType.cover => '${appId}p',
      SteamGridArtType.background => appId.toString(),
      SteamGridArtType.logo => '${appId}_logo',
      SteamGridArtType.hero => '${appId}_hero',
    };

    return (gridPath, filename);
  }

  Future<void> deleteCache() async {
    final gridPath = _gridPath;
    if (await Directory(gridPath).exists()) {
      await Directory(gridPath).delete(recursive: true);
      await Directory(gridPath).create();
    }
  }
}

sealed class SteamException {}

final class SteamUserFolderNotFoundException implements SteamException {
  const SteamUserFolderNotFoundException();
}

final class SteamShortcutsFileNotFoundException implements SteamException {
  const SteamShortcutsFileNotFoundException();
}

final class SteamShortcutsFileCannotBeParsedException implements SteamException {
  const SteamShortcutsFileCannotBeParsedException();
}

extension on SteamShortcut {
  static const emulators = [
    'org.libretro.RetroArch',
    'org.duckstation.DuckStation',
    'net.rpcs3.RPCS3',
  ];

  SteamProgramType toType() {
    if (launchOptions.contains('net.lutris.Lutris')) {
      return SteamProgramType.lutris;
    } else if (launchOptions.contains('com.heroicgameslauncher')) {
      return SteamProgramType.heroic;
    } else if (launchOptions.contains('Emulation/roms')) {
      return SteamProgramType.roms;
    } else if (target.contains('Emulation/roms')) {
      return SteamProgramType.roms;
    } else if (target.containsIn(emulators)) {
      return SteamProgramType.roms;
    }

    return SteamProgramType.other;
  }
}

extension on String {
  bool containsIn(Iterable<String> values) {
    for (final value in values) {
      if (contains(value)) {
        return true;
      }
    }

    return false;
  }
}
