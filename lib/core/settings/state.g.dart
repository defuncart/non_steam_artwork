// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsService)
const settingsServiceProvider = SettingsServiceProvider._();

final class SettingsServiceProvider
    extends
        $FunctionalProvider<
          ISettingsService,
          ISettingsService,
          ISettingsService
        >
    with $Provider<ISettingsService> {
  const SettingsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsServiceHash();

  @$internal
  @override
  $ProviderElement<ISettingsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ISettingsService create(Ref ref) {
    return settingsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ISettingsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ISettingsService>(value),
    );
  }
}

String _$settingsServiceHash() => r'6fb7bdf9781dc225a819622866251cae63e2ca54';

@ProviderFor(ThemeModeController)
const themeModeControllerProvider = ThemeModeControllerProvider._();

final class ThemeModeControllerProvider
    extends $NotifierProvider<ThemeModeController, ThemeMode> {
  const ThemeModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeControllerHash();

  @$internal
  @override
  ThemeModeController create() => ThemeModeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeControllerHash() =>
    r'7f13422a905d453327b0d5cb3e84131779d7c32d';

abstract class _$ThemeModeController extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(HasSeenOnboardingController)
const hasSeenOnboardingControllerProvider =
    HasSeenOnboardingControllerProvider._();

final class HasSeenOnboardingControllerProvider
    extends $NotifierProvider<HasSeenOnboardingController, bool> {
  const HasSeenOnboardingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasSeenOnboardingControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasSeenOnboardingControllerHash();

  @$internal
  @override
  HasSeenOnboardingController create() => HasSeenOnboardingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasSeenOnboardingControllerHash() =>
    r'1d87a3dc1c5c8e00d3879b5b78a24cd264df06ba';

abstract class _$HasSeenOnboardingController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FilteredProgramTypesController)
const filteredProgramTypesControllerProvider =
    FilteredProgramTypesControllerProvider._();

final class FilteredProgramTypesControllerProvider
    extends
        $NotifierProvider<
          FilteredProgramTypesController,
          Map<SteamProgramType, bool>
        > {
  const FilteredProgramTypesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredProgramTypesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredProgramTypesControllerHash();

  @$internal
  @override
  FilteredProgramTypesController create() => FilteredProgramTypesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<SteamProgramType, bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<SteamProgramType, bool>>(value),
    );
  }
}

String _$filteredProgramTypesControllerHash() =>
    r'75d56c062b66d32bce0028f4090a5b4b0f32df4c';

abstract class _$FilteredProgramTypesController
    extends $Notifier<Map<SteamProgramType, bool>> {
  Map<SteamProgramType, bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<Map<SteamProgramType, bool>, Map<SteamProgramType, bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<SteamProgramType, bool>,
                Map<SteamProgramType, bool>
              >,
              Map<SteamProgramType, bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SortProgramTypeController)
const sortProgramTypeControllerProvider = SortProgramTypeControllerProvider._();

final class SortProgramTypeControllerProvider
    extends $NotifierProvider<SortProgramTypeController, SortProgramType> {
  const SortProgramTypeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortProgramTypeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortProgramTypeControllerHash();

  @$internal
  @override
  SortProgramTypeController create() => SortProgramTypeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortProgramType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortProgramType>(value),
    );
  }
}

String _$sortProgramTypeControllerHash() =>
    r'1842386459e03d964d242e63a3b1f60c0458268b';

abstract class _$SortProgramTypeController extends $Notifier<SortProgramType> {
  SortProgramType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SortProgramType, SortProgramType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SortProgramType, SortProgramType>,
              SortProgramType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SortingAscendingController)
const sortingAscendingControllerProvider =
    SortingAscendingControllerProvider._();

final class SortingAscendingControllerProvider
    extends $NotifierProvider<SortingAscendingController, bool> {
  const SortingAscendingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortingAscendingControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortingAscendingControllerHash();

  @$internal
  @override
  SortingAscendingController create() => SortingAscendingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$sortingAscendingControllerHash() =>
    r'f75956f5962b3d46fb782c534c107482006906fb';

abstract class _$SortingAscendingController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SteamGridDBApiKeyController)
const steamGridDBApiKeyControllerProvider =
    SteamGridDBApiKeyControllerProvider._();

final class SteamGridDBApiKeyControllerProvider
    extends $NotifierProvider<SteamGridDBApiKeyController, String?> {
  const SteamGridDBApiKeyControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steamGridDBApiKeyControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steamGridDBApiKeyControllerHash();

  @$internal
  @override
  SteamGridDBApiKeyController create() => SteamGridDBApiKeyController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$steamGridDBApiKeyControllerHash() =>
    r'b5a955a9364dc7e42ad83fbe56b1dc4c66544890';

abstract class _$SteamGridDBApiKeyController extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
