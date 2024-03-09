import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/settings/filtered_program_types.dart';
import 'package:non_steam_artwork/core/settings/settings_service.dart';
import 'package:non_steam_artwork/core/settings/sort_program_type.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
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

@riverpod
class FilteredProgramTypesController extends _$FilteredProgramTypesController {
  late FilteredProgramTypes _state;
  Map<SteamProgramType, bool> _mapState() {
    _state = ref.read(settingsServiceProvider).filteredProgramTypes;
    return _state.internalMap;
  }

  @override
  Map<SteamProgramType, bool> build() => _mapState();

  void toggle(SteamProgramType type) {
    _state.toggleTypeValue(type);
    ref.read(settingsServiceProvider).filteredProgramTypes = _state;
    state = _mapState();
  }
}

@riverpod
class SortProgramTypeController extends _$SortProgramTypeController {
  @override
  SortProgramType build() => ref.read(settingsServiceProvider).sortProgramType;

  void set(SortProgramType type) {
    if (state != type) {
      ref.read(settingsServiceProvider).sortProgramType = type;
      state = type;
    }
  }
}

@riverpod
class SortingAscendingController extends _$SortingAscendingController {
  @override
  bool build() => ref.read(settingsServiceProvider).isSortingAscending;

  void toggle() {
    state = !state;
    ref.read(settingsServiceProvider).isSortingAscending = state;
  }
}

@riverpod
class SteamGridDBApiKeyController extends _$SteamGridDBApiKeyController {
  @override
  String? build() => ref.read(settingsServiceProvider).steamGridDBApiKey;

  void set(String? value) {
    if (state != value) {
      ref.read(settingsServiceProvider).steamGridDBApiKey = value;
      state = value;
    }
  }
}
