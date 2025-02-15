import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LicensesScreen {
  LicensesScreen._();

  // TODO Migrate to multi window if possible, otherwise do not allow multi pushes
  static void show(BuildContext context) => showLicensePage(
    context: context,
    applicationName: 'Non-Steam Artwork',
    applicationLegalese: '©2024 com.defuncart',
  );

  static var _isInitialized = false;
  static void initRegistry() {
    if (!_isInitialized) {
      LicenseRegistry.addLicense(() async* {
        yield _CustomLicenseEntry(
          ['steam_shortcuts_util'],
          [
            const LicenseParagraph('''
Steam Shortcuts utility

Steam Shortcuts is a utility crate that helps you to manage your Steam shortcuts. It is a simple Rust crate that provides a simple interface to manage your Steam shortcuts.

Created by https://github.com/PhilipK

Source code: https://github.com/PhilipK/steam_shortcuts_util
''', 0),
          ],
        );
      });
      _isInitialized = true;
    }
  }
}

class _CustomLicenseEntry extends LicenseEntry {
  _CustomLicenseEntry(this.packages, this.paragraphs);

  @override
  final Iterable<String> packages;

  @override
  final Iterable<LicenseParagraph> paragraphs;
}
