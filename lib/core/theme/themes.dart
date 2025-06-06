import 'package:flex_color_scheme/flex_color_scheme.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.blueM3,
  appBarBackground: FlexThemeData.light(scheme: FlexScheme.blueM3).colorScheme.surface,
);

final darkTheme = FlexThemeData.dark(scheme: FlexScheme.blueM3);
