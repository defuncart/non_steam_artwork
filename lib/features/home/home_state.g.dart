// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$steamProgramsHash() => r'8609391030ac89b5bae56dc39975687624cc3074';

/// See also [steamPrograms].
@ProviderFor(steamPrograms)
final steamProgramsProvider = AutoDisposeFutureProvider<Iterable<SteamProgram>>.internal(
  steamPrograms,
  name: r'steamProgramsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$steamProgramsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SteamProgramsRef = AutoDisposeFutureProviderRef<Iterable<SteamProgram>>;
String _$freeCacheHash() => r'131f7eb1bd840f3593bee19e54e8a64104ba43da';

/// See also [FreeCache].
@ProviderFor(FreeCache)
final freeCacheProvider = AutoDisposeAsyncNotifierProvider<FreeCache, int>.internal(
  FreeCache.new,
  name: r'freeCacheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$freeCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FreeCache = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package