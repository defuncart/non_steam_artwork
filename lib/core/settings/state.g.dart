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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
