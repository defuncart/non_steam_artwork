// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getShortcuts)
const getShortcutsProvider = GetShortcutsProvider._();

final class GetShortcutsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SteamShortcut>>,
          List<SteamShortcut>,
          FutureOr<List<SteamShortcut>>
        >
    with
        $FutureModifier<List<SteamShortcut>>,
        $FutureProvider<List<SteamShortcut>> {
  const GetShortcutsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getShortcutsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getShortcutsHash();

  @$internal
  @override
  $FutureProviderElement<List<SteamShortcut>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SteamShortcut>> create(Ref ref) {
    return getShortcuts(ref);
  }
}

String _$getShortcutsHash() => r'3e99aa0db197f2e7fb66c7ed63f4bba79ce3d7c8';
