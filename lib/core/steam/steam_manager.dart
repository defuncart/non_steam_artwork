import 'package:flutter/foundation.dart';
import 'package:non_steam_artwork/core/steam/steam_shortcuts.dart';
import 'package:non_steam_artwork/src/rust/api/simple.dart';

export 'package:non_steam_artwork/src/rust/api/simple.dart' show SteamShortcut;

class SteamManager {
  const SteamManager({
    this.steamShortcuts = const SteamShortcuts(),
  });

  final SteamShortcuts steamShortcuts;

  Future<void> init() async {
    await steamShortcuts.init();
  }

  String get _steamDir => switch (defaultTargetPlatform) {
        TargetPlatform.linux => '/home/deck/.steam/steam/userdata/325483446/',
        _ => '/Users/deck/Downloads/_steam/',
      };

  // TODO(jamesflutterdev): Add error handling
  Future<List<SteamShortcut>> getShortcuts() => steamShortcuts.getShortcuts(_steamDir);
}
