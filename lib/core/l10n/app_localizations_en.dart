// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeAppBarSearchHintLabel => 'Search...';

  @override
  String get homeAppBarSortLabel => 'Sort';

  @override
  String get homeAppBarSortDateAdded => 'Added';

  @override
  String get homeAppBarSortAlphabetic => 'Name';

  @override
  String get homeAppBarSortProgramId => 'Id';

  @override
  String get homeAppBarSortLastPlayed => 'Played';

  @override
  String homeErrorLabel1(Object error) {
    return 'An error has occured: $error.';
  }

  @override
  String get homeErrorLabel2 => 'Please view logs and report this issue.';

  @override
  String get homeTipsOnboardingManualDescription => 'Manual has not been viewed. Please consult the manual before first usage.';

  @override
  String get homeTipsOnboardingManualCacheButton => 'View';

  @override
  String get homeTipsBackupCacheDescription => 'No cache back found. A backup is recommended before editing artwork.';

  @override
  String get homeTipsBackupCacheButton => 'Backup';

  @override
  String homeTipsCleanUpCacheDescription(Object value) {
    return 'There is unused art in your cache. You can free up $value.';
  }

  @override
  String get homeTipsCleanUpCacheButton => 'Clean up';

  @override
  String get homeTipsAddApiKeyDescription => 'A SteamGridDB api key is required in order to download artwork.';

  @override
  String get homeTipsAddApiKeyButton => 'Add key';

  @override
  String get homeSearchEmpty => 'No results founds.';

  @override
  String get homeProgramsEmpty => 'No programs found.';

  @override
  String get homeArtworkEmpty => 'No artwork found.';

  @override
  String get homeProgramSearchSteamGridDB => 'Search on SteamGridDB';

  @override
  String get homeProgramArtworkPaste => 'Paste';

  @override
  String get homeProgramArtworkDelete => 'Delete';

  @override
  String get homeProgramArtworkCreateEmptyLogo => 'Create empty logo';

  @override
  String get homeProgramArtworkSetBackgroundAsHero => 'Set as hero';

  @override
  String get homeProgramArtworkSetHeroAsBackground => 'Set as background';

  @override
  String get homeProgramPasteError => 'Clipboard contents is not JPEG/PNG';

  @override
  String get menuBarFile => 'File';

  @override
  String get menuBarFileQuit => 'Quit';

  @override
  String get menuBarCache => 'Cache';

  @override
  String get menuBarCacheOpen => 'Open';

  @override
  String get menuBarCacheBackup => 'Backup';

  @override
  String get menuBarCacheDeleteAll => 'Delete All';

  @override
  String get menuBarOptions => 'Options';

  @override
  String get menuBarOptionsApiKey => 'SteamGridDB Api Key';

  @override
  String get menuBarOptionsTheme => 'Theme';

  @override
  String get menuBarOptionsThemeSystem => 'System';

  @override
  String get menuBarOptionsThemeLight => 'Light';

  @override
  String get menuBarOptionsThemeDark => 'Dark';

  @override
  String get menuBarView => 'View';

  @override
  String get menuBarViewManual => 'Manual';

  @override
  String get menuBarViewShortcutsViewer => 'Shortcuts Viewer';

  @override
  String get menuBarViewLogs => 'Logs';

  @override
  String get menuBarViewShowLicenses => 'Licenses';

  @override
  String get menuBarViewShowPrivacyPolicy => 'Privacy Policy';

  @override
  String get generalErrorTitle => 'An error has occured';

  @override
  String get generalErrorNoInternetDescription => 'Please ensure that there is an active internet connection';

  @override
  String get generalErrorTryAgain => 'Try again';

  @override
  String get generalOk => 'Ok';

  @override
  String get logsScreenTitle => 'Logs';

  @override
  String get privacyPolicyScreenTitle => 'Privacy Policy';

  @override
  String get manualScreenTitle => 'Manual';

  @override
  String get steamGridDBDialogTitle => 'API key';

  @override
  String get steamGridDBDialogDescription => 'An api key from [SteamGridDB](https://www.steamgriddb.com/) is required in order to download artwork.';

  @override
  String get shortcutsScreenTitle => 'Shortcuts';
}
