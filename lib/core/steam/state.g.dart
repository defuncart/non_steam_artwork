// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(steamManager)
final steamManagerProvider = SteamManagerProvider._();

final class SteamManagerProvider extends $FunctionalProvider<SteamManager, SteamManager, SteamManager>
    with $Provider<SteamManager> {
  SteamManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steamManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steamManagerHash();

  @$internal
  @override
  $ProviderElement<SteamManager> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SteamManager create(Ref ref) {
    return steamManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SteamManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SteamManager>(value),
    );
  }
}

String _$steamManagerHash() => r'60afbfcca71afa9ed26414d1d82f9821e05f62a6';
