// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(splashState)
final splashStateProvider = SplashStateProvider._();

final class SplashStateProvider extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  SplashStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashStateHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return splashState(ref);
  }
}

String _$splashStateHash() => r'e43b5c3e04957999ac3e278b1db0aac478953221';
