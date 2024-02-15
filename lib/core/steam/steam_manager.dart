import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:non_steam_artwork/core/steam/steam_shortcuts.dart';
import 'package:non_steam_artwork/src/rust/api/simple.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

export 'package:non_steam_artwork/src/rust/api/simple.dart' show SteamShortcut;

class SteamManager {
  const SteamManager({
    this.steamShortcuts = const SteamShortcuts(),
  });

  final SteamShortcuts steamShortcuts;

  Future<void> init() async {
    await steamShortcuts.init();
  }

  Future<String?> _getSteamDir() async {
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

  // TODO Add error handling
  Future<List<SteamShortcut>> getShortcuts() async {
    final steamDir = await _getSteamDir();
    final shortcutsPath = path.join(steamDir!, 'config', 'shortcuts.vdf');
    if (await File(shortcutsPath).exists()) {
      return steamShortcuts.getShortcuts(shortcutsPath);
    }

    throw Exception();
  }
}
