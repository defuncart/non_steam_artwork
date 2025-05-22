import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/configs/window_config.dart';
import 'package:non_steam_artwork/core/settings/settings_service.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:non_steam_artwork/core/ui/my_app.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsService = SettingsService();
  await settingsService.init();

  setWindowMinSize(minWindowSize);

  runApp(ProviderScope(overrides: [settingsServiceProvider.overrideWithValue(settingsService)], child: const MyApp()));
}
