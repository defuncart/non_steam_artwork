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

  bool get isSortingAscending;
  set isSortingAscending(bool value);

  String? get steamGridDBApiKey;
  set steamGridDBApiKey(String? value);
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
  ThemeMode get themeMode => _getEnumValue<ThemeMode>(
        key: _Keys.themeMode,
        values: ThemeMode.values,
        defaultValue: _Defaults.themeMode,
      );

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
  SortProgramType get sortProgramType => _getEnumValue<SortProgramType>(
        key: _Keys.sortProgramType,
        values: SortProgramType.values,
        defaultValue: _Defaults.sortProgramType,
      );

  @override
  set sortProgramType(SortProgramType value) => _box.put(_Keys.sortProgramType, value.index);

  @override
  bool get isSortingAscending => _box.get(
        _Keys.isSortingAscending,
        defaultValue: _Defaults.isSortingAscending,
      );

  @override
  set isSortingAscending(bool value) => _box.put(_Keys.isSortingAscending, value);

  @override
  String? get steamGridDBApiKey => _box.get(_Keys.steamGridDBApiKey);

  @override
  set steamGridDBApiKey(String? value) => _box.put(_Keys.steamGridDBApiKey, value);

  T _getEnumValue<T extends Enum>({
    required String key,
    required List<T> values,
    required T defaultValue,
  }) {
    try {
      final index = _box.get(key) as int;
      return values[index];
    } catch (_) {
      return defaultValue;
    }
  }
}

class _Keys {
  _Keys._();

  static const themeMode = 'themeMode';
  static const filteredProgramTypes = 'filteredProgramTypes';
  static const sortProgramType = 'sortProgramType';
  static const steamGridDBApiKey = 'steamGridDBApiKey';
  static const isSortingAscending = 'isSortingAscending';
}

class _Defaults {
  _Defaults._();

  static const themeMode = ThemeMode.system;
  static final filteredProgramTypes = FilteredProgramTypes();
  static const sortProgramType = SortProgramType.dateAdded;
  static const isSortingAscending = true;
}
