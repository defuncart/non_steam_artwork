import 'package:flutter/material.dart';

class LicensesScreen {
  LicensesScreen._();

  // TODO Migrate to multi window if possible, otherwise do not allow multi pushes
  static void show(BuildContext context) => showLicensePage(
        context: context,
        applicationName: 'Non-Steam Artwork',
        applicationLegalese: '©2024 com.defuncart',
      );
}
