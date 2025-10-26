// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_fileManager)
const _fileManagerProvider = _FileManagerProvider._();

final class _FileManagerProvider
    extends $FunctionalProvider<FileManager, FileManager, FileManager>
    with $Provider<FileManager> {
  const _FileManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_fileManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_fileManagerHash();

  @$internal
  @override
  $ProviderElement<FileManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FileManager create(Ref ref) {
    return _fileManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FileManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FileManager>(value),
    );
  }
}

String _$_fileManagerHash() => r'735168694ba0c31dde76d61ee5f5eca8470e56e1';

@ProviderFor(SteamFolderExistsController)
const steamFolderExistsControllerProvider =
    SteamFolderExistsControllerProvider._();

final class SteamFolderExistsControllerProvider
    extends $AsyncNotifierProvider<SteamFolderExistsController, bool> {
  const SteamFolderExistsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steamFolderExistsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steamFolderExistsControllerHash();

  @$internal
  @override
  SteamFolderExistsController create() => SteamFolderExistsController();
}

String _$steamFolderExistsControllerHash() =>
    r'00ef2fb8acab6278a869af79a8d8e30f651a38ca';

abstract class _$SteamFolderExistsController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CacheController)
const cacheControllerProvider = CacheControllerProvider._();

final class CacheControllerProvider
    extends $AsyncNotifierProvider<CacheController, int> {
  const CacheControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheControllerHash();

  @$internal
  @override
  CacheController create() => CacheController();
}

String _$cacheControllerHash() => r'f2c77ef7969f1ca19a70927e3e55159deff8ef79';

abstract class _$CacheController extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(cacheBackupExistsController)
const cacheBackupExistsControllerProvider =
    CacheBackupExistsControllerProvider._();

final class CacheBackupExistsControllerProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const CacheBackupExistsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cacheBackupExistsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cacheBackupExistsControllerHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return cacheBackupExistsController(ref);
  }
}

String _$cacheBackupExistsControllerHash() =>
    r'e6fd1afb7cfc020b99b96b3164211aab25556949';

@ProviderFor(SearchController)
const searchControllerProvider = SearchControllerProvider._();

final class SearchControllerProvider
    extends $NotifierProvider<SearchController, String> {
  const SearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchControllerHash();

  @$internal
  @override
  SearchController create() => SearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchControllerHash() => r'7efb716fb420b888117b1599b12b86aff5179cb6';

abstract class _$SearchController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SteamPrograms)
const steamProgramsProvider = SteamProgramsProvider._();

final class SteamProgramsProvider
    extends $AsyncNotifierProvider<SteamPrograms, Iterable<SteamProgram>> {
  const SteamProgramsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steamProgramsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steamProgramsHash();

  @$internal
  @override
  SteamPrograms create() => SteamPrograms();
}

String _$steamProgramsHash() => r'f9b8d1cbbcbdb1cd2e8369d2e774beb1d26feb32';

abstract class _$SteamPrograms extends $AsyncNotifier<Iterable<SteamProgram>> {
  FutureOr<Iterable<SteamProgram>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Iterable<SteamProgram>>, Iterable<SteamProgram>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Iterable<SteamProgram>>,
                Iterable<SteamProgram>
              >,
              AsyncValue<Iterable<SteamProgram>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(deleteArtwork)
const deleteArtworkProvider = DeleteArtworkFamily._();

final class DeleteArtworkProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteArtworkProvider._({
    required DeleteArtworkFamily super.from,
    required File super.argument,
  }) : super(
         retry: null,
         name: r'deleteArtworkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteArtworkHash();

  @override
  String toString() {
    return r'deleteArtworkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as File;
    return deleteArtwork(ref, file: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteArtworkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteArtworkHash() => r'c1495b4b4de0d94d811c1f59933da1c0bc51a912';

final class DeleteArtworkFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, File> {
  const DeleteArtworkFamily._()
    : super(
        retry: null,
        name: r'deleteArtworkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteArtworkProvider call({required File file}) =>
      DeleteArtworkProvider._(argument: file, from: this);

  @override
  String toString() => r'deleteArtworkProvider';
}

@ProviderFor(copyArtwork)
const copyArtworkProvider = CopyArtworkFamily._();

final class CopyArtworkProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CopyArtworkProvider._({
    required CopyArtworkFamily super.from,
    required ({File file, SteamGridArtType artType}) super.argument,
  }) : super(
         retry: null,
         name: r'copyArtworkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$copyArtworkHash();

  @override
  String toString() {
    return r'copyArtworkProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({File file, SteamGridArtType artType});
    return copyArtwork(ref, file: argument.file, artType: argument.artType);
  }

  @override
  bool operator ==(Object other) {
    return other is CopyArtworkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$copyArtworkHash() => r'7745522c0d87c4914ee03b10f59bafc23d14c67b';

final class CopyArtworkFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({File file, SteamGridArtType artType})
        > {
  const CopyArtworkFamily._()
    : super(
        retry: null,
        name: r'copyArtworkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CopyArtworkProvider call({
    required File file,
    required SteamGridArtType artType,
  }) => CopyArtworkProvider._(
    argument: (file: file, artType: artType),
    from: this,
  );

  @override
  String toString() => r'copyArtworkProvider';
}

@ProviderFor(createArtworkFile)
const createArtworkFileProvider = CreateArtworkFileFamily._();

final class CreateArtworkFileProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CreateArtworkFileProvider._({
    required CreateArtworkFileFamily super.from,
    required ({int appId, File file, String ext, SteamGridArtType artType})
    super.argument,
  }) : super(
         retry: null,
         name: r'createArtworkFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createArtworkFileHash();

  @override
  String toString() {
    return r'createArtworkFileProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as ({int appId, File file, String ext, SteamGridArtType artType});
    return createArtworkFile(
      ref,
      appId: argument.appId,
      file: argument.file,
      ext: argument.ext,
      artType: argument.artType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateArtworkFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createArtworkFileHash() => r'cdf043bc3c370d3bada6e788c54bdc66f29ccb0d';

final class CreateArtworkFileFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({int appId, File file, String ext, SteamGridArtType artType})
        > {
  const CreateArtworkFileFamily._()
    : super(
        retry: null,
        name: r'createArtworkFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateArtworkFileProvider call({
    required int appId,
    required File file,
    required String ext,
    required SteamGridArtType artType,
  }) => CreateArtworkFileProvider._(
    argument: (appId: appId, file: file, ext: ext, artType: artType),
    from: this,
  );

  @override
  String toString() => r'createArtworkFileProvider';
}

@ProviderFor(createArtwork)
const createArtworkProvider = CreateArtworkFamily._();

final class CreateArtworkProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CreateArtworkProvider._({
    required CreateArtworkFamily super.from,
    required ({
      int appId,
      Stream<Uint8List> bytesStream,
      String ext,
      SteamGridArtType artType,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'createArtworkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createArtworkHash();

  @override
  String toString() {
    return r'createArtworkProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int appId,
              Stream<Uint8List> bytesStream,
              String ext,
              SteamGridArtType artType,
            });
    return createArtwork(
      ref,
      appId: argument.appId,
      bytesStream: argument.bytesStream,
      ext: argument.ext,
      artType: argument.artType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateArtworkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createArtworkHash() => r'fd69b15aca82582cf7a69f7a509b7a7ef8656333';

final class CreateArtworkFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            int appId,
            Stream<Uint8List> bytesStream,
            String ext,
            SteamGridArtType artType,
          })
        > {
  const CreateArtworkFamily._()
    : super(
        retry: null,
        name: r'createArtworkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateArtworkProvider call({
    required int appId,
    required Stream<Uint8List> bytesStream,
    required String ext,
    required SteamGridArtType artType,
  }) => CreateArtworkProvider._(
    argument: (
      appId: appId,
      bytesStream: bytesStream,
      ext: ext,
      artType: artType,
    ),
    from: this,
  );

  @override
  String toString() => r'createArtworkProvider';
}

@ProviderFor(saveLogoPosition)
const saveLogoPositionProvider = SaveLogoPositionFamily._();

final class SaveLogoPositionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const SaveLogoPositionProvider._({
    required SaveLogoPositionFamily super.from,
    required ({int appId, LogoPositionType position, double size})
    super.argument,
  }) : super(
         retry: null,
         name: r'saveLogoPositionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveLogoPositionHash();

  @override
  String toString() {
    return r'saveLogoPositionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument as ({int appId, LogoPositionType position, double size});
    return saveLogoPosition(
      ref,
      appId: argument.appId,
      position: argument.position,
      size: argument.size,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveLogoPositionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveLogoPositionHash() => r'e8898674c15c55aadec426e423ba98971856cd54';

final class SaveLogoPositionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({int appId, LogoPositionType position, double size})
        > {
  const SaveLogoPositionFamily._()
    : super(
        retry: null,
        name: r'saveLogoPositionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SaveLogoPositionProvider call({
    required int appId,
    required LogoPositionType position,
    required double size,
  }) => SaveLogoPositionProvider._(
    argument: (appId: appId, position: position, size: size),
    from: this,
  );

  @override
  String toString() => r'saveLogoPositionProvider';
}

@ProviderFor(_ReplacedFilesController)
const _replacedFilesControllerProvider = _ReplacedFilesControllerProvider._();

final class _ReplacedFilesControllerProvider
    extends $NotifierProvider<_ReplacedFilesController, Set<String>> {
  const _ReplacedFilesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_replacedFilesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_replacedFilesControllerHash();

  @$internal
  @override
  _ReplacedFilesController create() => _ReplacedFilesController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$_replacedFilesControllerHash() =>
    r'f701387fd3dca548fecaf909c453be847d29a0ec';

abstract class _$ReplacedFilesController extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(WasFileReplacedController)
const wasFileReplacedControllerProvider = WasFileReplacedControllerFamily._();

final class WasFileReplacedControllerProvider
    extends $NotifierProvider<WasFileReplacedController, bool> {
  const WasFileReplacedControllerProvider._({
    required WasFileReplacedControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'wasFileReplacedControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wasFileReplacedControllerHash();

  @override
  String toString() {
    return r'wasFileReplacedControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WasFileReplacedController create() => WasFileReplacedController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WasFileReplacedControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wasFileReplacedControllerHash() =>
    r'69297efee1b523fd9c6bd670bc8a6df416aaaf94';

final class WasFileReplacedControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          WasFileReplacedController,
          bool,
          bool,
          bool,
          String
        > {
  const WasFileReplacedControllerFamily._()
    : super(
        retry: null,
        name: r'wasFileReplacedControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WasFileReplacedControllerProvider call(String path) =>
      WasFileReplacedControllerProvider._(argument: path, from: this);

  @override
  String toString() => r'wasFileReplacedControllerProvider';
}

abstract class _$WasFileReplacedController extends $Notifier<bool> {
  late final _$args = ref.$arg as String;
  String get path => _$args;

  bool build(String path);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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

@ProviderFor(DownloadableArtworkController)
const downloadableArtworkControllerProvider =
    DownloadableArtworkControllerFamily._();

final class DownloadableArtworkControllerProvider
    extends
        $AsyncNotifierProvider<
          DownloadableArtworkController,
          DownloadableArtworkState
        > {
  const DownloadableArtworkControllerProvider._({
    required DownloadableArtworkControllerFamily super.from,
    required ({String initialSearchTerm, SteamGridArtType artType})
    super.argument,
  }) : super(
         retry: null,
         name: r'downloadableArtworkControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadableArtworkControllerHash();

  @override
  String toString() {
    return r'downloadableArtworkControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DownloadableArtworkController create() => DownloadableArtworkController();

  @override
  bool operator ==(Object other) {
    return other is DownloadableArtworkControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadableArtworkControllerHash() =>
    r'1515038bfd153f75fbfd6bbc35aaa5d490003b79';

final class DownloadableArtworkControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DownloadableArtworkController,
          AsyncValue<DownloadableArtworkState>,
          DownloadableArtworkState,
          FutureOr<DownloadableArtworkState>,
          ({String initialSearchTerm, SteamGridArtType artType})
        > {
  const DownloadableArtworkControllerFamily._()
    : super(
        retry: null,
        name: r'downloadableArtworkControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadableArtworkControllerProvider call({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  }) => DownloadableArtworkControllerProvider._(
    argument: (initialSearchTerm: initialSearchTerm, artType: artType),
    from: this,
  );

  @override
  String toString() => r'downloadableArtworkControllerProvider';
}

abstract class _$DownloadableArtworkController
    extends $AsyncNotifier<DownloadableArtworkState> {
  late final _$args =
      ref.$arg as ({String initialSearchTerm, SteamGridArtType artType});
  String get initialSearchTerm => _$args.initialSearchTerm;
  SteamGridArtType get artType => _$args.artType;

  FutureOr<DownloadableArtworkState> build({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      initialSearchTerm: _$args.initialSearchTerm,
      artType: _$args.artType,
    );
    final ref =
        this.ref
            as $Ref<
              AsyncValue<DownloadableArtworkState>,
              DownloadableArtworkState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DownloadableArtworkState>,
                DownloadableArtworkState
              >,
              AsyncValue<DownloadableArtworkState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(downloadFileSize)
const downloadFileSizeProvider = DownloadFileSizeFamily._();

final class DownloadFileSizeProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const DownloadFileSizeProvider._({
    required DownloadFileSizeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'downloadFileSizeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadFileSizeHash();

  @override
  String toString() {
    return r'downloadFileSizeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return downloadFileSize(ref, url: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadFileSizeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadFileSizeHash() => r'3eda62d6f71e02e73cd8120274092f548d17d337';

final class DownloadFileSizeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  const DownloadFileSizeFamily._()
    : super(
        retry: null,
        name: r'downloadFileSizeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadFileSizeProvider call({required String url}) =>
      DownloadFileSizeProvider._(argument: url, from: this);

  @override
  String toString() => r'downloadFileSizeProvider';
}
