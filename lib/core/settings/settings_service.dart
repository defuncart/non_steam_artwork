import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

abstract class ISettingsService {
  ThemeMode get themeMode;
  set themeMode(ThemeMode value);
}

class SettingsService extends ISettingsService {
  late final Box<dynamic> _box;
  static const _name = 'settings';

  SettingsService() {
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
}

class _Keys {
  _Keys._();

  static const themeMode = 'themeMode';
}

class _Defaults {
  _Defaults._();

  static const themeMode = ThemeMode.system;
}
