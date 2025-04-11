// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileManagerHash() => r'735168694ba0c31dde76d61ee5f5eca8470e56e1';

/// See also [_fileManager].
@ProviderFor(_fileManager)
final _fileManagerProvider = Provider<FileManager>.internal(
  _fileManager,
  name: r'_fileManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$fileManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _FileManagerRef = ProviderRef<FileManager>;
String _$cacheBackupExistsControllerHash() => r'e6fd1afb7cfc020b99b96b3164211aab25556949';

/// See also [cacheBackupExistsController].
@ProviderFor(cacheBackupExistsController)
final cacheBackupExistsControllerProvider = AutoDisposeFutureProvider<bool>.internal(
  cacheBackupExistsController,
  name: r'cacheBackupExistsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$cacheBackupExistsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CacheBackupExistsControllerRef = AutoDisposeFutureProviderRef<bool>;
String _$deleteArtworkHash() => r'c1495b4b4de0d94d811c1f59933da1c0bc51a912';

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
class DeleteArtworkFamily extends Family<AsyncValue<void>> {
  /// See also [deleteArtwork].
  const DeleteArtworkFamily();

  /// See also [deleteArtwork].
  DeleteArtworkProvider call({required File file}) {
    return DeleteArtworkProvider(file: file);
  }

  @override
  DeleteArtworkProvider getProviderOverride(
    covariant DeleteArtworkProvider provider,
  ) {
    return call(file: provider.file);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'deleteArtworkProvider';
}

/// See also [deleteArtwork].
class DeleteArtworkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteArtwork].
  DeleteArtworkProvider({required File file})
    : this._internal(
        (ref) => deleteArtwork(ref as DeleteArtworkRef, file: file),
        from: deleteArtworkProvider,
        name: r'deleteArtworkProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$deleteArtworkHash,
        dependencies: DeleteArtworkFamily._dependencies,
        allTransitiveDependencies: DeleteArtworkFamily._allTransitiveDependencies,
        file: file,
      );

  DeleteArtworkProvider._internal(
    super._createNotifier, {
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
    FutureOr<void> Function(DeleteArtworkRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteArtworkProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteArtworkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `file` of this provider.
  File get file;
}

class _DeleteArtworkProviderElement extends AutoDisposeFutureProviderElement<void> with DeleteArtworkRef {
  _DeleteArtworkProviderElement(super.provider);

  @override
  File get file => (origin as DeleteArtworkProvider).file;
}

String _$copyArtworkHash() => r'0d3ca34448b2151112d18e49d9bfd68f04be1680';

/// See also [copyArtwork].
@ProviderFor(copyArtwork)
const copyArtworkProvider = CopyArtworkFamily();

/// See also [copyArtwork].
class CopyArtworkFamily extends Family<AsyncValue<void>> {
  /// See also [copyArtwork].
  const CopyArtworkFamily();

  /// See also [copyArtwork].
  CopyArtworkProvider call({
    required File file,
    required SteamGridArtType artType,
  }) {
    return CopyArtworkProvider(file: file, artType: artType);
  }

  @override
  CopyArtworkProvider getProviderOverride(
    covariant CopyArtworkProvider provider,
  ) {
    return call(file: provider.file, artType: provider.artType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'copyArtworkProvider';
}

/// See also [copyArtwork].
class CopyArtworkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [copyArtwork].
  CopyArtworkProvider({required File file, required SteamGridArtType artType})
    : this._internal(
        (ref) => copyArtwork(ref as CopyArtworkRef, file: file, artType: artType),
        from: copyArtworkProvider,
        name: r'copyArtworkProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$copyArtworkHash,
        dependencies: CopyArtworkFamily._dependencies,
        allTransitiveDependencies: CopyArtworkFamily._allTransitiveDependencies,
        file: file,
        artType: artType,
      );

  CopyArtworkProvider._internal(
    super._createNotifier, {
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
    FutureOr<void> Function(CopyArtworkRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CopyArtworkProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$createArtworkFileHash() => r'cdf043bc3c370d3bada6e788c54bdc66f29ccb0d';

/// See also [createArtworkFile].
@ProviderFor(createArtworkFile)
const createArtworkFileProvider = CreateArtworkFileFamily();

/// See also [createArtworkFile].
class CreateArtworkFileFamily extends Family<AsyncValue<void>> {
  /// See also [createArtworkFile].
  const CreateArtworkFileFamily();

  /// See also [createArtworkFile].
  CreateArtworkFileProvider call({
    required int appId,
    required File file,
    required String ext,
    required SteamGridArtType artType,
  }) {
    return CreateArtworkFileProvider(
      appId: appId,
      file: file,
      ext: ext,
      artType: artType,
    );
  }

  @override
  CreateArtworkFileProvider getProviderOverride(
    covariant CreateArtworkFileProvider provider,
  ) {
    return call(
      appId: provider.appId,
      file: provider.file,
      ext: provider.ext,
      artType: provider.artType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'createArtworkFileProvider';
}

/// See also [createArtworkFile].
class CreateArtworkFileProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createArtworkFile].
  CreateArtworkFileProvider({
    required int appId,
    required File file,
    required String ext,
    required SteamGridArtType artType,
  }) : this._internal(
         (ref) => createArtworkFile(
           ref as CreateArtworkFileRef,
           appId: appId,
           file: file,
           ext: ext,
           artType: artType,
         ),
         from: createArtworkFileProvider,
         name: r'createArtworkFileProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$createArtworkFileHash,
         dependencies: CreateArtworkFileFamily._dependencies,
         allTransitiveDependencies: CreateArtworkFileFamily._allTransitiveDependencies,
         appId: appId,
         file: file,
         ext: ext,
         artType: artType,
       );

  CreateArtworkFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
    required this.file,
    required this.ext,
    required this.artType,
  }) : super.internal();

  final int appId;
  final File file;
  final String ext;
  final SteamGridArtType artType;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateArtworkFileRef provider) create,
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
        ext: ext,
        artType: artType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateArtworkFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateArtworkFileProvider &&
        other.appId == appId &&
        other.file == file &&
        other.ext == ext &&
        other.artType == artType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);
    hash = _SystemHash.combine(hash, ext.hashCode);
    hash = _SystemHash.combine(hash, artType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateArtworkFileRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `appId` of this provider.
  int get appId;

  /// The parameter `file` of this provider.
  File get file;

  /// The parameter `ext` of this provider.
  String get ext;

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
  String get ext => (origin as CreateArtworkFileProvider).ext;
  @override
  SteamGridArtType get artType => (origin as CreateArtworkFileProvider).artType;
}

String _$createArtworkHash() => r'fd69b15aca82582cf7a69f7a509b7a7ef8656333';

/// See also [createArtwork].
@ProviderFor(createArtwork)
const createArtworkProvider = CreateArtworkFamily();

/// See also [createArtwork].
class CreateArtworkFamily extends Family<AsyncValue<void>> {
  /// See also [createArtwork].
  const CreateArtworkFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'createArtworkProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(CreateArtworkRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateArtworkProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$downloadFileSizeHash() => r'3eda62d6f71e02e73cd8120274092f548d17d337';

/// See also [downloadFileSize].
@ProviderFor(downloadFileSize)
const downloadFileSizeProvider = DownloadFileSizeFamily();

/// See also [downloadFileSize].
class DownloadFileSizeFamily extends Family<AsyncValue<String?>> {
  /// See also [downloadFileSize].
  const DownloadFileSizeFamily();

  /// See also [downloadFileSize].
  DownloadFileSizeProvider call({required String url}) {
    return DownloadFileSizeProvider(url: url);
  }

  @override
  DownloadFileSizeProvider getProviderOverride(
    covariant DownloadFileSizeProvider provider,
  ) {
    return call(url: provider.url);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'downloadFileSizeProvider';
}

/// See also [downloadFileSize].
class DownloadFileSizeProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [downloadFileSize].
  DownloadFileSizeProvider({required String url})
    : this._internal(
        (ref) => downloadFileSize(ref as DownloadFileSizeRef, url: url),
        from: downloadFileSizeProvider,
        name: r'downloadFileSizeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$downloadFileSizeHash,
        dependencies: DownloadFileSizeFamily._dependencies,
        allTransitiveDependencies: DownloadFileSizeFamily._allTransitiveDependencies,
        url: url,
      );

  DownloadFileSizeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    FutureOr<String?> Function(DownloadFileSizeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadFileSizeProvider._internal(
        (ref) => create(ref as DownloadFileSizeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _DownloadFileSizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadFileSizeProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DownloadFileSizeRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `url` of this provider.
  String get url;
}

class _DownloadFileSizeProviderElement extends AutoDisposeFutureProviderElement<String?> with DownloadFileSizeRef {
  _DownloadFileSizeProviderElement(super.provider);

  @override
  String get url => (origin as DownloadFileSizeProvider).url;
}

String _$steamFolderExistsControllerHash() => r'00ef2fb8acab6278a869af79a8d8e30f651a38ca';

/// See also [SteamFolderExistsController].
@ProviderFor(SteamFolderExistsController)
final steamFolderExistsControllerProvider =
    AutoDisposeAsyncNotifierProvider<SteamFolderExistsController, bool>.internal(
      SteamFolderExistsController.new,
      name: r'steamFolderExistsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$steamFolderExistsControllerHash,
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

  bool build(String path);
}

/// See also [WasFileReplacedController].
@ProviderFor(WasFileReplacedController)
const wasFileReplacedControllerProvider = WasFileReplacedControllerFamily();

/// See also [WasFileReplacedController].
class WasFileReplacedControllerFamily extends Family<bool> {
  /// See also [WasFileReplacedController].
  const WasFileReplacedControllerFamily();

  /// See also [WasFileReplacedController].
  WasFileReplacedControllerProvider call(String path) {
    return WasFileReplacedControllerProvider(path);
  }

  @override
  WasFileReplacedControllerProvider getProviderOverride(
    covariant WasFileReplacedControllerProvider provider,
  ) {
    return call(provider.path);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'wasFileReplacedControllerProvider';
}

/// See also [WasFileReplacedController].
class WasFileReplacedControllerProvider extends AutoDisposeNotifierProviderImpl<WasFileReplacedController, bool> {
  /// See also [WasFileReplacedController].
  WasFileReplacedControllerProvider(String path)
    : this._internal(
        () => WasFileReplacedController()..path = path,
        from: wasFileReplacedControllerProvider,
        name: r'wasFileReplacedControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$wasFileReplacedControllerHash,
        dependencies: WasFileReplacedControllerFamily._dependencies,
        allTransitiveDependencies: WasFileReplacedControllerFamily._allTransitiveDependencies,
        path: path,
      );

  WasFileReplacedControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  bool runNotifierBuild(covariant WasFileReplacedController notifier) {
    return notifier.build(path);
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
  AutoDisposeNotifierProviderElement<WasFileReplacedController, bool> createElement() {
    return _WasFileReplacedControllerProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WasFileReplacedControllerRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `path` of this provider.
  String get path;
}

class _WasFileReplacedControllerProviderElement
    extends AutoDisposeNotifierProviderElement<WasFileReplacedController, bool>
    with WasFileReplacedControllerRef {
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
class DownloadableArtworkControllerFamily extends Family<AsyncValue<DownloadableArtworkState>> {
  /// See also [DownloadableArtworkController].
  const DownloadableArtworkControllerFamily();

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

  @override
  DownloadableArtworkControllerProvider getProviderOverride(
    covariant DownloadableArtworkControllerProvider provider,
  ) {
    return call(
      initialSearchTerm: provider.initialSearchTerm,
      artType: provider.artType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'downloadableArtworkControllerProvider';
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
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$downloadableArtworkControllerHash,
         dependencies: DownloadableArtworkControllerFamily._dependencies,
         allTransitiveDependencies: DownloadableArtworkControllerFamily._allTransitiveDependencies,
         initialSearchTerm: initialSearchTerm,
         artType: artType,
       );

  DownloadableArtworkControllerProvider._internal(
    super._createNotifier, {
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
  AutoDisposeAsyncNotifierProviderElement<DownloadableArtworkController, DownloadableArtworkState> createElement() {
    return _DownloadableArtworkControllerProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
