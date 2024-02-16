import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
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
  var _cachedArtwork = <SteamGridCacheProgram>[];
  var _shortcutPrograms = <SteamShortcut>[];

  String? _userSteamDir;

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

  Future<void> init() async {
    await steamShortcuts.init();
    _userSteamDir = await _getUserSteamDir();
    if (_userSteamDir != null) {
      await _getCache();
      try {
        _shortcutPrograms = await getShortcuts();
        await _determineUnusedCache();
      } catch (_) {}
    }
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

  Future<void> _getCache() async {
    final gridPath = _gridPath;
    if (await Directory(gridPath).exists()) {
      _cachedArtwork = await SteamGridCache(gridPath).getCachePrograms();
    }
  }

  Future<void> _determineUnusedCache() async {
    final shortcutGameIds = _shortcutPrograms.map((e) => e.appId);
    final unused = _cachedArtwork.where((element) => !shortcutGameIds.contains(int.parse(element.id)));

    final files = unused.fold(
        [],
        (previousValue, element) => [
              ...previousValue,
              element.icon,
              element.cover,
              element.background,
              element.logo,
              element.hero,
            ]).whereType<File>();

    final totalBytes = files.fold(0, (previousValue, element) => previousValue + element.lengthSync());
    print(totalBytes.displaySize);
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
