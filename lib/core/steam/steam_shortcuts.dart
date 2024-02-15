import 'package:non_steam_artwork/src/rust/api/simple.dart';
import 'package:non_steam_artwork/src/rust/frb_generated.dart';
import 'package:path/path.dart';

class SteamShortcuts {
  const SteamShortcuts();

  Future<void> init() async {
    await RustLib.init();
  }

  Future<List<SteamShortcut>> getShortcuts(String steamDir) async {
    // Usually located at $SteamDirectory/userdata/$SteamUserId/config/shortcuts.vdf
    return parse(path: join(steamDir, 'config', 'shortcuts.vdf'));
  }
}
