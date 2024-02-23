import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/settings/settings_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';

@riverpod
ISettingsService settingsService(SettingsServiceRef ref) => SettingsService();

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() => ref.read(settingsServiceProvider).themeMode;

  void set(ThemeMode value) {
    if (state != value) {
      ref.read(settingsServiceProvider).themeMode = value;
      state = value;
    }
  }
}
