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
String _$deleteArtworkHash() => r'8c0c486dfeb99f1201b04fd45186d60e84c6424a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [deleteArtwork].
@ProviderFor(deleteArtwork)
const deleteArtworkProvider = DeleteArtworkFamily();

/// See also [deleteArtwork].
class DeleteArtworkFamily extends Family {
  /// See also [deleteArtwork].
  const DeleteArtworkFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'deleteArtworkProvider';

  /// See also [deleteArtwork].
  DeleteArtworkProvider call({
    required File file,
  }) {
    return DeleteArtworkProvider(
      file: file,
    );
  }

  @visibleForOverriding
  @override
  DeleteArtworkProvider getProviderOverride(
    covariant DeleteArtworkProvider provider,
  ) {
    return call(
      file: provider.file,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(DeleteArtworkRef ref) create) {
    return _$DeleteArtworkFamilyOverride(this, create);
  }
}

class _$DeleteArtworkFamilyOverride implements FamilyOverride {
  _$DeleteArtworkFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteArtworkRef ref) create;

  @override
  final DeleteArtworkFamily overriddenFamily;

  @override
  DeleteArtworkProvider getProviderOverride(
    covariant DeleteArtworkProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [deleteArtwork].
class DeleteArtworkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteArtwork].
  DeleteArtworkProvider({
    required File file,
  }) : this._internal(
          (ref) => deleteArtwork(
            ref as DeleteArtworkRef,
            file: file,
          ),
          from: deleteArtworkProvider,
          name: r'deleteArtworkProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$deleteArtworkHash,
          dependencies: DeleteArtworkFamily._dependencies,
          allTransitiveDependencies: DeleteArtworkFamily._allTransitiveDependencies,
          file: file,
        );

  DeleteArtworkProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.file,
  }) : super.internal();

  final File file;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteArtworkRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteArtworkProvider._internal(
        (ref) => create(ref as DeleteArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        file: file,
      ),
    );
  }

  @override
  ({
    File file,
  }) get argument {
    return (file: file,);
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteArtworkProviderElement(this);
  }

  DeleteArtworkProvider _copyWith(
    FutureOr<void> Function(DeleteArtworkRef ref) create,
  ) {
    return DeleteArtworkProvider._internal(
      (ref) => create(ref as DeleteArtworkRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      file: file,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteArtworkProvider && other.file == file;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteArtworkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `file` of this provider.
  File get file;
}

class _DeleteArtworkProviderElement extends AutoDisposeFutureProviderElement<void> with DeleteArtworkRef {
  _DeleteArtworkProviderElement(super.provider);

  @override
  File get file => (origin as DeleteArtworkProvider).file;
}

String _$copyArtworkHash() => r'7201284cf50dced35f87122206440e58ab030da0';

/// See also [copyArtwork].
@ProviderFor(copyArtwork)
const copyArtworkProvider = CopyArtworkFamily();

/// See also [copyArtwork].
class CopyArtworkFamily extends Family {
  /// See also [copyArtwork].
  const CopyArtworkFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'copyArtworkProvider';

  /// See also [copyArtwork].
  CopyArtworkProvider call({
    required File file,
    required SteamGridArtType artType,
  }) {
    return CopyArtworkProvider(
      file: file,
      artType: artType,
    );
  }

  @visibleForOverriding
  @override
  CopyArtworkProvider getProviderOverride(
    covariant CopyArtworkProvider provider,
  ) {
    return call(
      file: provider.file,
      artType: provider.artType,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(CopyArtworkRef ref) create) {
    return _$CopyArtworkFamilyOverride(this, create);
  }
}

class _$CopyArtworkFamilyOverride implements FamilyOverride {
  _$CopyArtworkFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(CopyArtworkRef ref) create;

  @override
  final CopyArtworkFamily overriddenFamily;

  @override
  CopyArtworkProvider getProviderOverride(
    covariant CopyArtworkProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [copyArtwork].
class CopyArtworkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [copyArtwork].
  CopyArtworkProvider({
    required File file,
    required SteamGridArtType artType,
  }) : this._internal(
          (ref) => copyArtwork(
            ref as CopyArtworkRef,
            file: file,
            artType: artType,
          ),
          from: copyArtworkProvider,
          name: r'copyArtworkProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$copyArtworkHash,
          dependencies: CopyArtworkFamily._dependencies,
          allTransitiveDependencies: CopyArtworkFamily._allTransitiveDependencies,
          file: file,
          artType: artType,
        );

  CopyArtworkProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.file,
    required this.artType,
  }) : super.internal();

  final File file;
  final SteamGridArtType artType;

  @override
  Override overrideWith(
    FutureOr<void> Function(CopyArtworkRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CopyArtworkProvider._internal(
        (ref) => create(ref as CopyArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        file: file,
        artType: artType,
      ),
    );
  }

  @override
  ({
    File file,
    SteamGridArtType artType,
  }) get argument {
    return (
      file: file,
      artType: artType,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CopyArtworkProviderElement(this);
  }

  CopyArtworkProvider _copyWith(
    FutureOr<void> Function(CopyArtworkRef ref) create,
  ) {
    return CopyArtworkProvider._internal(
      (ref) => create(ref as CopyArtworkRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      file: file,
      artType: artType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CopyArtworkProvider && other.file == file && other.artType == artType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);
    hash = _SystemHash.combine(hash, artType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CopyArtworkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `file` of this provider.
  File get file;

  /// The parameter `artType` of this provider.
  SteamGridArtType get artType;
}

class _CopyArtworkProviderElement extends AutoDisposeFutureProviderElement<void> with CopyArtworkRef {
  _CopyArtworkProviderElement(super.provider);

  @override
  File get file => (origin as CopyArtworkProvider).file;
  @override
  SteamGridArtType get artType => (origin as CopyArtworkProvider).artType;
}

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
