import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @homeAppBarSearchHintLabel.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get homeAppBarSearchHintLabel;

  /// No description provided for @homeAppBarSortLabel.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get homeAppBarSortLabel;

  /// No description provided for @homeAppBarSortDateAdded.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get homeAppBarSortDateAdded;

  /// No description provided for @homeAppBarSortAlphabetic.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get homeAppBarSortAlphabetic;

  /// No description provided for @homeAppBarSortProgramId.
  ///
  /// In en, this message translates to:
  /// **'Id'**
  String get homeAppBarSortProgramId;

  /// No description provided for @homeAppBarSortLastPlayed.
  ///
  /// In en, this message translates to:
  /// **'Played'**
  String get homeAppBarSortLastPlayed;

  /// No description provided for @homeErrorLabel1.
  ///
  /// In en, this message translates to:
  /// **'An error has occured: {error}.'**
  String homeErrorLabel1(Object error);

  /// No description provided for @homeErrorLabel2.
  ///
  /// In en, this message translates to:
  /// **'Please view logs and report this issue.'**
  String get homeErrorLabel2;

  /// No description provided for @homeTipsOnboardingManualDescription.
  ///
  /// In en, this message translates to:
  /// **'Manual has not been viewed. Please consult the manual before first usage.'**
  String get homeTipsOnboardingManualDescription;

  /// No description provided for @homeTipsOnboardingManualCacheButton.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get homeTipsOnboardingManualCacheButton;

  /// No description provided for @homeTipsBackupCacheDescription.
  ///
  /// In en, this message translates to:
  /// **'No cache back found. A backup is recommended before editing artwork.'**
  String get homeTipsBackupCacheDescription;

  /// No description provided for @homeTipsBackupCacheButton.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get homeTipsBackupCacheButton;

  /// No description provided for @homeTipsCleanUpCacheDescription.
  ///
  /// In en, this message translates to:
  /// **'There is unused art in your cache. You can free up {value}.'**
  String homeTipsCleanUpCacheDescription(Object value);

  /// No description provided for @homeTipsCleanUpCacheButton.
  ///
  /// In en, this message translates to:
  /// **'Clean up'**
  String get homeTipsCleanUpCacheButton;

  /// No description provided for @homeTipsAddApiKeyDescription.
  ///
  /// In en, this message translates to:
  /// **'A SteamGridDB api key is required in order to download artwork.'**
  String get homeTipsAddApiKeyDescription;

  /// No description provided for @homeTipsAddApiKeyButton.
  ///
  /// In en, this message translates to:
  /// **'Add key'**
  String get homeTipsAddApiKeyButton;

  /// No description provided for @homeSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No results founds.'**
  String get homeSearchEmpty;

  /// No description provided for @homeProgramsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No programs found.'**
  String get homeProgramsEmpty;

  /// No description provided for @homeArtworkEmpty.
  ///
  /// In en, this message translates to:
  /// **'No artwork found.'**
  String get homeArtworkEmpty;

  /// No description provided for @homeProgramSearchSteamGridDB.
  ///
  /// In en, this message translates to:
  /// **'Search on SteamGridDB'**
  String get homeProgramSearchSteamGridDB;

  /// No description provided for @homeProgramArtworkPaste.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get homeProgramArtworkPaste;

  /// No description provided for @homeProgramArtworkDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get homeProgramArtworkDelete;

  /// No description provided for @homeProgramArtworkCreateEmptyLogo.
  ///
  /// In en, this message translates to:
  /// **'Create empty logo'**
  String get homeProgramArtworkCreateEmptyLogo;

  /// No description provided for @homeProgramArtworkSetBackgroundAsHero.
  ///
  /// In en, this message translates to:
  /// **'Set as hero'**
  String get homeProgramArtworkSetBackgroundAsHero;

  /// No description provided for @homeProgramArtworkSetHeroAsBackground.
  ///
  /// In en, this message translates to:
  /// **'Set as background'**
  String get homeProgramArtworkSetHeroAsBackground;

  /// No description provided for @homeProgramPasteError.
  ///
  /// In en, this message translates to:
  /// **'Clipboard contents is not JPEG/PNG'**
  String get homeProgramPasteError;

  /// No description provided for @menuBarFile.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get menuBarFile;

  /// No description provided for @menuBarFileQuit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get menuBarFileQuit;

  /// No description provided for @menuBarCache.
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get menuBarCache;

  /// No description provided for @menuBarCacheOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get menuBarCacheOpen;

  /// No description provided for @menuBarCacheBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get menuBarCacheBackup;

  /// No description provided for @menuBarCacheDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get menuBarCacheDeleteAll;

  /// No description provided for @menuBarOptions.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get menuBarOptions;

  /// No description provided for @menuBarOptionsApiKey.
  ///
  /// In en, this message translates to:
  /// **'SteamGridDB Api Key'**
  String get menuBarOptionsApiKey;

  /// No description provided for @menuBarOptionsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get menuBarOptionsTheme;

  /// No description provided for @menuBarOptionsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get menuBarOptionsThemeSystem;

  /// No description provided for @menuBarOptionsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get menuBarOptionsThemeLight;

  /// No description provided for @menuBarOptionsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get menuBarOptionsThemeDark;

  /// No description provided for @menuBarView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get menuBarView;

  /// No description provided for @menuBarViewManual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get menuBarViewManual;

  /// No description provided for @menuBarViewShortcutsViewer.
  ///
  /// In en, this message translates to:
  /// **'Shortcuts Viewer'**
  String get menuBarViewShortcutsViewer;

  /// No description provided for @menuBarViewLogs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get menuBarViewLogs;

  /// No description provided for @menuBarViewShowLicenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get menuBarViewShowLicenses;

  /// No description provided for @menuBarViewShowPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get menuBarViewShowPrivacyPolicy;

  /// No description provided for @generalErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error has occured'**
  String get generalErrorTitle;

  /// No description provided for @generalErrorNoInternetDescription.
  ///
  /// In en, this message translates to:
  /// **'Please ensure that there is an active internet connection'**
  String get generalErrorNoInternetDescription;

  /// No description provided for @generalErrorTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get generalErrorTryAgain;

  /// No description provided for @generalOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get generalOk;

  /// No description provided for @logsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logsScreenTitle;

  /// No description provided for @privacyPolicyScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyScreenTitle;

  /// No description provided for @manualScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manualScreenTitle;

  /// No description provided for @steamGridDBDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'API key'**
  String get steamGridDBDialogTitle;

  /// No description provided for @steamGridDBDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'An api key from [SteamGridDB](https://www.steamgriddb.com/) is required in order to download artwork.'**
  String get steamGridDBDialogDescription;

  /// No description provided for @shortcutsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Shortcuts'**
  String get shortcutsScreenTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
