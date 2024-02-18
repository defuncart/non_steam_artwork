import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/ui/app_window.dart';

class LicensesWindow extends StatelessWidget {
  const LicensesWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppWindow(
      child: Padding(
        padding: EdgeInsets.only(top: 28),
        // TODO: Add steam_shortcuts_util license
        // https://docs.rs/steam_shortcuts_util/latest/steam_shortcuts_util/
        // https://github.com/PhilipK/steam_shortcuts_util
        child: LicensePage(
          applicationName: 'Non-Steam Artwork',
          applicationLegalese: '©2024 com.defuncart',
        ),
      ),
    );
  }

  static Future<void> show() async {
    final window = await DesktopMultiWindow.createWindow();
    window
      ..setFrame(const Offset(0, 0) & const Size(840, 620))
      ..center()
      ..show();
  }
}
