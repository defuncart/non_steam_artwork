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
String _$cacheBackupExistsControllerHash() => r'96a66906b9d16812efb9ae9b0620145cf59320ae';

/// See also [cacheBackupExistsController].
@ProviderFor(cacheBackupExistsController)
final cacheBackupExistsControllerProvider = AutoDisposeFutureProvider<bool>.internal(
  cacheBackupExistsController,
  name: r'cacheBackupExistsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$cacheBackupExistsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CacheBackupExistsControllerRef = AutoDisposeFutureProviderRef<bool>;
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

String _$copyArtworkHash() => r'049b3b43ccbda3c32a6d09c662c0ca4245bcebbb';

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

String _$createArtworkFileHash() => r'24295364a6863cb0ce67b15ff47d5ac13abc6f51';

/// See also [createArtworkFile].
@ProviderFor(createArtworkFile)
const createArtworkFileProvider = CreateArtworkFileFamily();

/// See also [createArtworkFile].
class CreateArtworkFileFamily extends Family {
  /// See also [createArtworkFile].
  const CreateArtworkFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'createArtworkFileProvider';

  /// See also [createArtworkFile].
  CreateArtworkFileProvider call({
    required int appId,
    required File file,
    required SteamGridArtType artType,
  }) {
    return CreateArtworkFileProvider(
      appId: appId,
      file: file,
      artType: artType,
    );
  }

  @visibleForOverriding
  @override
  CreateArtworkFileProvider getProviderOverride(
    covariant CreateArtworkFileProvider provider,
  ) {
    return call(
      appId: provider.appId,
      file: provider.file,
      artType: provider.artType,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(CreateArtworkFileRef ref) create) {
    return _$CreateArtworkFileFamilyOverride(this, create);
  }
}

class _$CreateArtworkFileFamilyOverride implements FamilyOverride {
  _$CreateArtworkFileFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(CreateArtworkFileRef ref) create;

  @override
  final CreateArtworkFileFamily overriddenFamily;

  @override
  CreateArtworkFileProvider getProviderOverride(
    covariant CreateArtworkFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [createArtworkFile].
class CreateArtworkFileProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createArtworkFile].
  CreateArtworkFileProvider({
    required int appId,
    required File file,
    required SteamGridArtType artType,
  }) : this._internal(
          (ref) => createArtworkFile(
            ref as CreateArtworkFileRef,
            appId: appId,
            file: file,
            artType: artType,
          ),
          from: createArtworkFileProvider,
          name: r'createArtworkFileProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$createArtworkFileHash,
          dependencies: CreateArtworkFileFamily._dependencies,
          allTransitiveDependencies: CreateArtworkFileFamily._allTransitiveDependencies,
          appId: appId,
          file: file,
          artType: artType,
        );

  CreateArtworkFileProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
    required this.file,
    required this.artType,
  }) : super.internal();

  final int appId;
  final File file;
  final SteamGridArtType artType;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateArtworkFileRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateArtworkFileProvider._internal(
        (ref) => create(ref as CreateArtworkFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appId: appId,
        file: file,
        artType: artType,
      ),
    );
  }

  @override
  ({
    int appId,
    File file,
    SteamGridArtType artType,
  }) get argument {
    return (
      appId: appId,
      file: file,
      artType: artType,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateArtworkFileProviderElement(this);
  }

  CreateArtworkFileProvider _copyWith(
    FutureOr<void> Function(CreateArtworkFileRef ref) create,
  ) {
    return CreateArtworkFileProvider._internal(
      (ref) => create(ref as CreateArtworkFileRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      appId: appId,
      file: file,
      artType: artType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateArtworkFileProvider && other.appId == appId && other.file == file && other.artType == artType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);
    hash = _SystemHash.combine(hash, artType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateArtworkFileRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `appId` of this provider.
  int get appId;

  /// The parameter `file` of this provider.
  File get file;

  /// The parameter `artType` of this provider.
  SteamGridArtType get artType;
}

class _CreateArtworkFileProviderElement extends AutoDisposeFutureProviderElement<void> with CreateArtworkFileRef {
  _CreateArtworkFileProviderElement(super.provider);

  @override
  int get appId => (origin as CreateArtworkFileProvider).appId;
  @override
  File get file => (origin as CreateArtworkFileProvider).file;
  @override
  SteamGridArtType get artType => (origin as CreateArtworkFileProvider).artType;
}

String _$createArtworkHash() => r'4dc1aa8badace29b7a59f8dca2d5101182568e0a';

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

String _$steamFolderExistsControllerHash() => r'00ef2fb8acab6278a869af79a8d8e30f651a38ca';

/// See also [SteamFolderExistsController].
@ProviderFor(SteamFolderExistsController)
final steamFolderExistsControllerProvider =
    AutoDisposeAsyncNotifierProvider<SteamFolderExistsController, bool>.internal(
  SteamFolderExistsController.new,
  name: r'steamFolderExistsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$steamFolderExistsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteamFolderExistsController = AutoDisposeAsyncNotifier<bool>;
String _$cacheControllerHash() => r'f2c77ef7969f1ca19a70927e3e55159deff8ef79';

/// See also [CacheController].
@ProviderFor(CacheController)
final cacheControllerProvider = AsyncNotifierProvider<CacheController, int>.internal(
  CacheController.new,
  name: r'cacheControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$cacheControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CacheController = AsyncNotifier<int>;
String _$searchControllerHash() => r'7efb716fb420b888117b1599b12b86aff5179cb6';

/// See also [SearchController].
@ProviderFor(SearchController)
final searchControllerProvider = NotifierProvider<SearchController, String>.internal(
  SearchController.new,
  name: r'searchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$searchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchController = Notifier<String>;
String _$steamProgramsHash() => r'f9b8d1cbbcbdb1cd2e8369d2e774beb1d26feb32';

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
String _$replacedFilesControllerHash() => r'f701387fd3dca548fecaf909c453be847d29a0ec';

/// See also [_ReplacedFilesController].
@ProviderFor(_ReplacedFilesController)
final _replacedFilesControllerProvider = NotifierProvider<_ReplacedFilesController, Set<String>>.internal(
  _ReplacedFilesController.new,
  name: r'_replacedFilesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$replacedFilesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReplacedFilesController = Notifier<Set<String>>;
String _$wasFileReplacedControllerHash() => r'69297efee1b523fd9c6bd670bc8a6df416aaaf94';

abstract class _$WasFileReplacedController extends BuildlessAutoDisposeNotifier<bool> {
  late final String path;

  bool build(
    String path,
  );
}

/// See also [WasFileReplacedController].
@ProviderFor(WasFileReplacedController)
const wasFileReplacedControllerProvider = WasFileReplacedControllerFamily();

/// See also [WasFileReplacedController].
class WasFileReplacedControllerFamily extends Family {
  /// See also [WasFileReplacedController].
  const WasFileReplacedControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'wasFileReplacedControllerProvider';

  /// See also [WasFileReplacedController].
  WasFileReplacedControllerProvider call(
    String path,
  ) {
    return WasFileReplacedControllerProvider(
      path,
    );
  }

  @visibleForOverriding
  @override
  WasFileReplacedControllerProvider getProviderOverride(
    covariant WasFileReplacedControllerProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(WasFileReplacedController Function() create) {
    return _$WasFileReplacedControllerFamilyOverride(this, create);
  }
}

class _$WasFileReplacedControllerFamilyOverride implements FamilyOverride {
  _$WasFileReplacedControllerFamilyOverride(this.overriddenFamily, this.create);

  final WasFileReplacedController Function() create;

  @override
  final WasFileReplacedControllerFamily overriddenFamily;

  @override
  WasFileReplacedControllerProvider getProviderOverride(
    covariant WasFileReplacedControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [WasFileReplacedController].
class WasFileReplacedControllerProvider extends AutoDisposeNotifierProviderImpl<WasFileReplacedController, bool> {
  /// See also [WasFileReplacedController].
  WasFileReplacedControllerProvider(
    String path,
  ) : this._internal(
          () => WasFileReplacedController()..path = path,
          from: wasFileReplacedControllerProvider,
          name: r'wasFileReplacedControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$wasFileReplacedControllerHash,
          dependencies: WasFileReplacedControllerFamily._dependencies,
          allTransitiveDependencies: WasFileReplacedControllerFamily._allTransitiveDependencies,
          path: path,
        );

  WasFileReplacedControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  bool runNotifierBuild(
    covariant WasFileReplacedController notifier,
  ) {
    return notifier.build(
      path,
    );
  }

  @override
  Override overrideWith(WasFileReplacedController Function() create) {
    return ProviderOverride(
      origin: this,
      override: WasFileReplacedControllerProvider._internal(
        () => create()..path = path,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  (String,) get argument {
    return (path,);
  }

  @override
  AutoDisposeNotifierProviderElement<WasFileReplacedController, bool> createElement() {
    return _WasFileReplacedControllerProviderElement(this);
  }

  WasFileReplacedControllerProvider _copyWith(
    WasFileReplacedController Function() create,
  ) {
    return WasFileReplacedControllerProvider._internal(
      () => create()..path = path,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      path: path,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WasFileReplacedControllerProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WasFileReplacedControllerRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `path` of this provider.
  String get path;
}

class _WasFileReplacedControllerProviderElement
    extends AutoDisposeNotifierProviderElement<WasFileReplacedController, bool> with WasFileReplacedControllerRef {
  _WasFileReplacedControllerProviderElement(super.provider);

  @override
  String get path => (origin as WasFileReplacedControllerProvider).path;
}

String _$downloadableArtworkControllerHash() => r'b476a7f8e7cbf3c50a2b5601312178e8f43f96a0';

abstract class _$DownloadableArtworkController extends BuildlessAutoDisposeAsyncNotifier<DownloadableArtworkState> {
  late final String initialSearchTerm;
  late final SteamGridArtType artType;

  FutureOr<DownloadableArtworkState> build({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  });
}

/// See also [DownloadableArtworkController].
@ProviderFor(DownloadableArtworkController)
const downloadableArtworkControllerProvider = DownloadableArtworkControllerFamily();

/// See also [DownloadableArtworkController].
class DownloadableArtworkControllerFamily extends Family {
  /// See also [DownloadableArtworkController].
  const DownloadableArtworkControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'downloadableArtworkControllerProvider';

  /// See also [DownloadableArtworkController].
  DownloadableArtworkControllerProvider call({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  }) {
    return DownloadableArtworkControllerProvider(
      initialSearchTerm: initialSearchTerm,
      artType: artType,
    );
  }

  @visibleForOverriding
  @override
  DownloadableArtworkControllerProvider getProviderOverride(
    covariant DownloadableArtworkControllerProvider provider,
  ) {
    return call(
      initialSearchTerm: provider.initialSearchTerm,
      artType: provider.artType,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(DownloadableArtworkController Function() create) {
    return _$DownloadableArtworkControllerFamilyOverride(this, create);
  }
}

class _$DownloadableArtworkControllerFamilyOverride implements FamilyOverride {
  _$DownloadableArtworkControllerFamilyOverride(this.overriddenFamily, this.create);

  final DownloadableArtworkController Function() create;

  @override
  final DownloadableArtworkControllerFamily overriddenFamily;

  @override
  DownloadableArtworkControllerProvider getProviderOverride(
    covariant DownloadableArtworkControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [DownloadableArtworkController].
class DownloadableArtworkControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DownloadableArtworkController, DownloadableArtworkState> {
  /// See also [DownloadableArtworkController].
  DownloadableArtworkControllerProvider({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  }) : this._internal(
          () => DownloadableArtworkController()
            ..initialSearchTerm = initialSearchTerm
            ..artType = artType,
          from: downloadableArtworkControllerProvider,
          name: r'downloadableArtworkControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$downloadableArtworkControllerHash,
          dependencies: DownloadableArtworkControllerFamily._dependencies,
          allTransitiveDependencies: DownloadableArtworkControllerFamily._allTransitiveDependencies,
          initialSearchTerm: initialSearchTerm,
          artType: artType,
        );

  DownloadableArtworkControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialSearchTerm,
    required this.artType,
  }) : super.internal();

  final String initialSearchTerm;
  final SteamGridArtType artType;

  @override
  FutureOr<DownloadableArtworkState> runNotifierBuild(
    covariant DownloadableArtworkController notifier,
  ) {
    return notifier.build(
      initialSearchTerm: initialSearchTerm,
      artType: artType,
    );
  }

  @override
  Override overrideWith(DownloadableArtworkController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DownloadableArtworkControllerProvider._internal(
        () => create()
          ..initialSearchTerm = initialSearchTerm
          ..artType = artType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialSearchTerm: initialSearchTerm,
        artType: artType,
      ),
    );
  }

  @override
  ({
    String initialSearchTerm,
    SteamGridArtType artType,
  }) get argument {
    return (
      initialSearchTerm: initialSearchTerm,
      artType: artType,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DownloadableArtworkController, DownloadableArtworkState> createElement() {
    return _DownloadableArtworkControllerProviderElement(this);
  }

  DownloadableArtworkControllerProvider _copyWith(
    DownloadableArtworkController Function() create,
  ) {
    return DownloadableArtworkControllerProvider._internal(
      () => create()
        ..initialSearchTerm = initialSearchTerm
        ..artType = artType,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      initialSearchTerm: initialSearchTerm,
      artType: artType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadableArtworkControllerProvider &&
        other.initialSearchTerm == initialSearchTerm &&
        other.artType == artType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialSearchTerm.hashCode);
    hash = _SystemHash.combine(hash, artType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadableArtworkControllerRef on AutoDisposeAsyncNotifierProviderRef<DownloadableArtworkState> {
  /// The parameter `initialSearchTerm` of this provider.
  String get initialSearchTerm;

  /// The parameter `artType` of this provider.
  SteamGridArtType get artType;
}

class _DownloadableArtworkControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DownloadableArtworkController, DownloadableArtworkState>
    with DownloadableArtworkControllerRef {
  _DownloadableArtworkControllerProviderElement(super.provider);

  @override
  String get initialSearchTerm => (origin as DownloadableArtworkControllerProvider).initialSearchTerm;
  @override
  SteamGridArtType get artType => (origin as DownloadableArtworkControllerProvider).artType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
