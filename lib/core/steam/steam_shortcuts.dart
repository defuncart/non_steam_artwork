import 'package:non_steam_artwork/src/rust/api/simple.dart';
import 'package:non_steam_artwork/src/rust/frb_generated.dart';

class SteamShortcuts {
  const SteamShortcuts();

  Future<void> init() async {
    await RustLib.init();
  }

  Future<void> getShortcuts() async {
    print(greet(name: 'Dash'));
  }
}
