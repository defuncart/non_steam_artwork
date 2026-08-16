// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(steamGridDBClient)
final steamGridDBClientProvider = SteamGridDBClientProvider._();

final class SteamGridDBClientProvider extends $FunctionalProvider<SteamGridDB, SteamGridDB, SteamGridDB>
    with $Provider<SteamGridDB> {
  SteamGridDBClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steamGridDBClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steamGridDBClientHash();

  @$internal
  @override
  $ProviderElement<SteamGridDB> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SteamGridDB create(Ref ref) {
    return steamGridDBClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SteamGridDB value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SteamGridDB>(value),
    );
  }
}

String _$steamGridDBClientHash() => r'04a20516aec258f14be18f9aaa6a1fea2155a2d8';
