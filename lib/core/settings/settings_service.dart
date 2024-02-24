import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:non_steam_artwork/core/settings/filtered_program_types.dart';

abstract class ISettingsService {
  ThemeMode get themeMode;
  set themeMode(ThemeMode value);

  FilteredProgramTypes get filteredProgramTypes;
  set filteredProgramTypes(FilteredProgramTypes value);
}

class SettingsService extends ISettingsService {
  late final Box<dynamic> _box;
  static const _name = 'settings';

  SettingsService() {
    Hive.registerAdapter(
      '$FilteredProgramTypes',
      (json) => FilteredProgramTypes.fromJson(json),
    );
    _box = Hive.box<dynamic>(name: _name);
  }

  @override
  ThemeMode get themeMode {
    try {
      final index = _box.get(_Keys.themeMode) as int;
      return ThemeMode.values[index];
    } catch (_) {
      return _Defaults.themeMode;
    }
  }

  @override
  set themeMode(ThemeMode value) => _box.put(_Keys.themeMode, value.index);

  @override
  FilteredProgramTypes get filteredProgramTypes => _box.get(
        _Keys.filteredProgramTypes,
        defaultValue: _Defaults.filteredProgramTypes,
      );

  @override
  set filteredProgramTypes(FilteredProgramTypes value) => _box.put(_Keys.filteredProgramTypes, value);
}

class _Keys {
  _Keys._();

  static const themeMode = 'themeMode';
  static const filteredProgramTypes = 'filteredProgramTypes';
}

class _Defaults {
  _Defaults._();

  static const themeMode = ThemeMode.system;
  static final filteredProgramTypes = FilteredProgramTypes();
}
