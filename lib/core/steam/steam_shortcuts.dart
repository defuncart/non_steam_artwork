import 'package:flutter/foundation.dart';
import 'package:non_steam_artwork/src/rust/api/simple.dart';
import 'package:non_steam_artwork/src/rust/frb_generated.dart';

export 'package:non_steam_artwork/src/rust/api/simple.dart' show SteamShortcut;

class SteamShortcuts {
  const SteamShortcuts();

  Future<void> init() async {
    await RustLib.init();
  }

  Future<List<SteamShortcut>> getShortcuts() async {
    // Usually located at $SteamDirectory/userdata/$SteamUserId/config/shortcuts.vdf
    final path = switch (defaultTargetPlatform) {
      TargetPlatform.linux => '/home/deck/.steam/steam/userdata/325483446/config/shortcuts.vdf',
      _ => '/Users/defuncart/Downloads/_steam/config/shortcuts.vdf',
    };
    return parse(path: path);
  }
}
