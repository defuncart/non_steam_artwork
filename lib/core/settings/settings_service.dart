import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:non_steam_artwork/core/settings/filtered_program_types.dart';
import 'package:non_steam_artwork/core/settings/sort_program_type.dart';

abstract class ISettingsService {
  ThemeMode get themeMode;
  set themeMode(ThemeMode value);

  FilteredProgramTypes get filteredProgramTypes;
  set filteredProgramTypes(FilteredProgramTypes value);

  SortProgramType get sortProgramType;
  set sortProgramType(SortProgramType value);
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

  @override
  SortProgramType get sortProgramType {
    try {
      final index = _box.get(_Keys.sortProgramType) as int;
      return SortProgramType.values[index];
    } catch (_) {
      return _Defaults.sortProgramType;
    }
  }

  @override
  set sortProgramType(SortProgramType value) => _box.put(_Keys.sortProgramType, value.index);
}

class _Keys {
  _Keys._();

  static const themeMode = 'themeMode';
  static const filteredProgramTypes = 'filteredProgramTypes';
  static const sortProgramType = 'sortProgramType';
}

class _Defaults {
  _Defaults._();

  static const themeMode = ThemeMode.system;
  static final filteredProgramTypes = FilteredProgramTypes();
  static const sortProgramType = SortProgramType.dateAdded;
}
