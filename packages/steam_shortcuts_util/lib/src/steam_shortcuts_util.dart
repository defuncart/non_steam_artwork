import 'rust/api/simple.dart';
import 'rust/frb_generated.dart';

class SteamShortcutsUtil {
  const SteamShortcutsUtil();

  Future<void> init() async {
    await RustLib.init();
  }

  Future<List<SteamShortcut>> getShortcuts(String path) async {
    // Usually located at $SteamDirectory/userdata/$SteamUserId/config/shortcuts.vdf
    return parse(path: path);
  }
}
