import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:non_steam_artwork/core/steam/steam_cache.dart';
import 'package:non_steam_artwork/core/steam/steam_shortcuts.dart';
import 'package:non_steam_artwork/src/rust/api/simple.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

export 'package:non_steam_artwork/src/rust/api/simple.dart' show SteamShortcut;

class SteamManager {
  SteamManager({
    this.steamShortcuts = const SteamShortcuts(),
  });

  final SteamShortcuts steamShortcuts;
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

  Future<String?> _getUserSteamDir() async {
    final userPath = switch (defaultTargetPlatform) {
      TargetPlatform.linux => '/home/deck/.steam/steam/userdata/',
      _ => path.join((await getDownloadsDirectory())!.path, '_steam'),
    };

    final userDir = Directory(userPath);
    if (await userDir.exists()) {
      final subDirs = (await userDir.list().toList()).whereType<Directory>();
      if (subDirs.isNotEmpty) {
        // in case there are multiple users, first is chosen
        return subDirs.first.path;
      }
    }

    return null;
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
    final unused = _cachedArtwork.where((artwork) => !shortcutGameIds.contains(artwork.id));

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
