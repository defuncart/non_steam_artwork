import 'package:material_ui/material_ui.dart';
import 'package:non_steam_artwork/core/l10n/generated/app_localizations.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
