// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsServiceHash() => r'4bccfb676ebd858ab40a19467757914c93e0fea6';

/// See also [settingsService].
@ProviderFor(settingsService)
final settingsServiceProvider = AutoDisposeProvider<ISettingsService>.internal(
  settingsService,
  name: r'settingsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$settingsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SettingsServiceRef = AutoDisposeProviderRef<ISettingsService>;
String _$themeModeControllerHash() => r'7f13422a905d453327b0d5cb3e84131779d7c32d';

/// See also [ThemeModeController].
@ProviderFor(ThemeModeController)
final themeModeControllerProvider = NotifierProvider<ThemeModeController, ThemeMode>.internal(
  ThemeModeController.new,
  name: r'themeModeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$themeModeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeController = Notifier<ThemeMode>;
String _$hasSeenOnboardingControllerHash() => r'1d87a3dc1c5c8e00d3879b5b78a24cd264df06ba';

/// See also [HasSeenOnboardingController].
@ProviderFor(HasSeenOnboardingController)
final hasSeenOnboardingControllerProvider = AutoDisposeNotifierProvider<HasSeenOnboardingController, bool>.internal(
  HasSeenOnboardingController.new,
  name: r'hasSeenOnboardingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$hasSeenOnboardingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HasSeenOnboardingController = AutoDisposeNotifier<bool>;
String _$filteredProgramTypesControllerHash() => r'75d56c062b66d32bce0028f4090a5b4b0f32df4c';

/// See also [FilteredProgramTypesController].
@ProviderFor(FilteredProgramTypesController)
final filteredProgramTypesControllerProvider =
    AutoDisposeNotifierProvider<FilteredProgramTypesController, Map<SteamProgramType, bool>>.internal(
  FilteredProgramTypesController.new,
  name: r'filteredProgramTypesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$filteredProgramTypesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilteredProgramTypesController = AutoDisposeNotifier<Map<SteamProgramType, bool>>;
String _$sortProgramTypeControllerHash() => r'1842386459e03d964d242e63a3b1f60c0458268b';

/// See also [SortProgramTypeController].
@ProviderFor(SortProgramTypeController)
final sortProgramTypeControllerProvider =
    AutoDisposeNotifierProvider<SortProgramTypeController, SortProgramType>.internal(
  SortProgramTypeController.new,
  name: r'sortProgramTypeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$sortProgramTypeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortProgramTypeController = AutoDisposeNotifier<SortProgramType>;
String _$sortingAscendingControllerHash() => r'f75956f5962b3d46fb782c534c107482006906fb';

/// See also [SortingAscendingController].
@ProviderFor(SortingAscendingController)
final sortingAscendingControllerProvider = AutoDisposeNotifierProvider<SortingAscendingController, bool>.internal(
  SortingAscendingController.new,
  name: r'sortingAscendingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$sortingAscendingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortingAscendingController = AutoDisposeNotifier<bool>;
String _$steamGridDBApiKeyControllerHash() => r'b5a955a9364dc7e42ad83fbe56b1dc4c66544890';

/// See also [SteamGridDBApiKeyController].
@ProviderFor(SteamGridDBApiKeyController)
final steamGridDBApiKeyControllerProvider = AutoDisposeNotifierProvider<SteamGridDBApiKeyController, String?>.internal(
  SteamGridDBApiKeyController.new,
  name: r'steamGridDBApiKeyControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$steamGridDBApiKeyControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteamGridDBApiKeyController = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
