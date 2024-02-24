// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileManagerHash() => r'16054c52e313d2a2d8a8ed6b491b0a1b4361bac8';

/// See also [_fileManager].
@ProviderFor(_fileManager)
final _fileManagerProvider = Provider<FileManager>.internal(
  _fileManager,
  name: r'_fileManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$fileManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _FileManagerRef = ProviderRef<FileManager>;
String _$deleteArtworkHash() => r'd6680917a6dd88b69aed24a69072e30cd8b8d2f6';

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

String _$copyArtworkHash() => r'b855792ddaddfdf835edcecbf5008822c2079ba4';

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

String _$createArtworkHash() => r'10dde8001c06bc7422dd3816b6d487026704caa1';

/// See also [createArtwork].
@ProviderFor(createArtwork)
const createArtworkProvider = CreateArtworkFamily();

/// See also [createArtwork].
class CreateArtworkFamily extends Family {
  /// See also [createArtwork].
  const CreateArtworkFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'createArtworkProvider';

  /// See also [createArtwork].
  CreateArtworkProvider call({
    required int appId,
    required Stream<Uint8List> bytesStream,
    required String ext,
    required SteamGridArtType artType,
  }) {
    return CreateArtworkProvider(
      appId: appId,
      bytesStream: bytesStream,
      ext: ext,
      artType: artType,
    );
  }

  @visibleForOverriding
  @override
  CreateArtworkProvider getProviderOverride(
    covariant CreateArtworkProvider provider,
  ) {
    return call(
      appId: provider.appId,
      bytesStream: provider.bytesStream,
      ext: provider.ext,
      artType: provider.artType,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(CreateArtworkRef ref) create) {
    return _$CreateArtworkFamilyOverride(this, create);
  }
}

class _$CreateArtworkFamilyOverride implements FamilyOverride {
  _$CreateArtworkFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(CreateArtworkRef ref) create;

  @override
  final CreateArtworkFamily overriddenFamily;

  @override
  CreateArtworkProvider getProviderOverride(
    covariant CreateArtworkProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [createArtwork].
class CreateArtworkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createArtwork].
  CreateArtworkProvider({
    required int appId,
    required Stream<Uint8List> bytesStream,
    required String ext,
    required SteamGridArtType artType,
  }) : this._internal(
          (ref) => createArtwork(
            ref as CreateArtworkRef,
            appId: appId,
            bytesStream: bytesStream,
            ext: ext,
            artType: artType,
          ),
          from: createArtworkProvider,
          name: r'createArtworkProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$createArtworkHash,
          dependencies: CreateArtworkFamily._dependencies,
          allTransitiveDependencies: CreateArtworkFamily._allTransitiveDependencies,
          appId: appId,
          bytesStream: bytesStream,
          ext: ext,
          artType: artType,
        );

  CreateArtworkProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
    required this.bytesStream,
    required this.ext,
    required this.artType,
  }) : super.internal();

  final int appId;
  final Stream<Uint8List> bytesStream;
  final String ext;
  final SteamGridArtType artType;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateArtworkRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateArtworkProvider._internal(
        (ref) => create(ref as CreateArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appId: appId,
        bytesStream: bytesStream,
        ext: ext,
        artType: artType,
      ),
    );
  }

  @override
  ({
    int appId,
    Stream<Uint8List> bytesStream,
    String ext,
    SteamGridArtType artType,
  }) get argument {
    return (
      appId: appId,
      bytesStream: bytesStream,
      ext: ext,
      artType: artType,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateArtworkProviderElement(this);
  }

  CreateArtworkProvider _copyWith(
    FutureOr<void> Function(CreateArtworkRef ref) create,
  ) {
    return CreateArtworkProvider._internal(
      (ref) => create(ref as CreateArtworkRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      appId: appId,
      bytesStream: bytesStream,
      ext: ext,
      artType: artType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateArtworkProvider &&
        other.appId == appId &&
        other.bytesStream == bytesStream &&
        other.ext == ext &&
        other.artType == artType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);
    hash = _SystemHash.combine(hash, bytesStream.hashCode);
    hash = _SystemHash.combine(hash, ext.hashCode);
    hash = _SystemHash.combine(hash, artType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateArtworkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `appId` of this provider.
  int get appId;

  /// The parameter `bytesStream` of this provider.
  Stream<Uint8List> get bytesStream;

  /// The parameter `ext` of this provider.
  String get ext;

  /// The parameter `artType` of this provider.
  SteamGridArtType get artType;
}

class _CreateArtworkProviderElement extends AutoDisposeFutureProviderElement<void> with CreateArtworkRef {
  _CreateArtworkProviderElement(super.provider);

  @override
  int get appId => (origin as CreateArtworkProvider).appId;
  @override
  Stream<Uint8List> get bytesStream => (origin as CreateArtworkProvider).bytesStream;
  @override
  String get ext => (origin as CreateArtworkProvider).ext;
  @override
  SteamGridArtType get artType => (origin as CreateArtworkProvider).artType;
}

String _$cacheControllerHash() => r'd8f11b48c8863c5eae01166e56731b7b2cb3fa82';

/// See also [CacheController].
@ProviderFor(CacheController)
final cacheControllerProvider = AutoDisposeAsyncNotifierProvider<CacheController, int>.internal(
  CacheController.new,
  name: r'cacheControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$cacheControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CacheController = AutoDisposeAsyncNotifier<int>;
String _$steamProgramsHash() => r'650effd632bbc3b04e32c42d59212a7542163376';

/// See also [SteamPrograms].
@ProviderFor(SteamPrograms)
final steamProgramsProvider = AutoDisposeAsyncNotifierProvider<SteamPrograms, Iterable<SteamProgram>>.internal(
  SteamPrograms.new,
  name: r'steamProgramsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$steamProgramsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteamPrograms = AutoDisposeAsyncNotifier<Iterable<SteamProgram>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
