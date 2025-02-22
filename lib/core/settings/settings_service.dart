import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:non_steam_artwork/core/settings/filtered_program_types.dart';
import 'package:non_steam_artwork/core/settings/sort_program_type.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

abstract class ISettingsService {
  Future<void> init();
  String get defaultDirectory;

  ThemeMode get themeMode;
  set themeMode(ThemeMode value);

  bool get hasSeenOnboarding;
  set hasSeenOnboarding(bool value);

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
  late final String _defaultDirectory;

  @override
  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    _defaultDirectory = p.join(dir.path, 'non_steam_artwork');
    if (!await Directory(_defaultDirectory).exists()) {
      await Directory(_defaultDirectory).create(recursive: true);
    }
    Hive.init(_defaultDirectory);

    _box = await Hive.openBox<dynamic>(_name);
  }

  @override
  String get defaultDirectory => _defaultDirectory;

  @override
  ThemeMode get themeMode =>
      _getEnumValue<ThemeMode>(key: _Keys.themeMode, values: ThemeMode.values, defaultValue: _Defaults.themeMode);

  @override
  set themeMode(ThemeMode value) => _box.put(_Keys.themeMode, value.index);

  @override
  bool get hasSeenOnboarding => _box.get(_Keys.hasSeenOnboarding, defaultValue: _Defaults.hasSeenOnboarding);

  @override
  set hasSeenOnboarding(bool value) => _box.put(_Keys.hasSeenOnboarding, value);

  @override
  FilteredProgramTypes get filteredProgramTypes {
    final rawString = _box.get(_Keys.filteredProgramTypes);
    if (rawString != null) {
      try {
        final json = jsonDecode(rawString);
        return FilteredProgramTypes.fromJson(json);
      } catch (_) {}
    }

    return _Defaults.filteredProgramTypes;
  }

  @override
  set filteredProgramTypes(FilteredProgramTypes value) {
    _box.put(_Keys.filteredProgramTypes, jsonEncode(value.toJson()));
  }

  @override
  SortProgramType get sortProgramType => _getEnumValue<SortProgramType>(
    key: _Keys.sortProgramType,
    values: SortProgramType.values,
    defaultValue: _Defaults.sortProgramType,
  );

  @override
  set sortProgramType(SortProgramType value) => _box.put(_Keys.sortProgramType, value.index);

  @override
  bool get isSortingAscending => _box.get(_Keys.isSortingAscending, defaultValue: _Defaults.isSortingAscending);

  @override
  set isSortingAscending(bool value) => _box.put(_Keys.isSortingAscending, value);

  @override
  String? get steamGridDBApiKey => _box.get(_Keys.steamGridDBApiKey);

  @override
  set steamGridDBApiKey(String? value) => _box.put(_Keys.steamGridDBApiKey, value);

  T _getEnumValue<T extends Enum>({required String key, required List<T> values, required T defaultValue}) {
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
  static const hasSeenOnboarding = 'hasSeenOnboarding';
  static const filteredProgramTypes = 'filteredProgramTypes';
  static const sortProgramType = 'sortProgramType';
  static const steamGridDBApiKey = 'steamGridDBApiKey';
  static const isSortingAscending = 'isSortingAscending';
}

class _Defaults {
  _Defaults._();

  static const themeMode = ThemeMode.system;
  static const hasSeenOnboarding = false;
  static final filteredProgramTypes = FilteredProgramTypes();
  static const sortProgramType = SortProgramType.dateAdded;
  static const isSortingAscending = true;
}
