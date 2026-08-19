// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_fileManager)
final _fileManagerProvider = _FileManagerProvider._();

final class _FileManagerProvider extends $FunctionalProvider<FileManager, FileManager, FileManager>
    with $Provider<FileManager> {
  _FileManagerProvider._()
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
  $ProviderElement<FileManager> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

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
final steamFolderExistsControllerProvider = SteamFolderExistsControllerProvider._();

final class SteamFolderExistsControllerProvider extends $AsyncNotifierProvider<SteamFolderExistsController, bool> {
  SteamFolderExistsControllerProvider._()
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

String _$steamFolderExistsControllerHash() => r'00ef2fb8acab6278a869af79a8d8e30f651a38ca';

abstract class _$SteamFolderExistsController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<AsyncValue<bool>, bool>, AsyncValue<bool>, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CacheController)
final cacheControllerProvider = CacheControllerProvider._();

final class CacheControllerProvider extends $AsyncNotifierProvider<CacheController, int> {
  CacheControllerProvider._()
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

String _$cacheControllerHash() => r'50f098d24be87c29355fc1f2401f142e9cee794f';

abstract class _$CacheController extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<AsyncValue<int>, int>, AsyncValue<int>, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(cacheBackupExistsController)
final cacheBackupExistsControllerProvider = CacheBackupExistsControllerProvider._();

final class CacheBackupExistsControllerProvider extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  CacheBackupExistsControllerProvider._()
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
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return cacheBackupExistsController(ref);
  }
}

String _$cacheBackupExistsControllerHash() => r'e6fd1afb7cfc020b99b96b3164211aab25556949';

@ProviderFor(SearchController)
final searchControllerProvider = SearchControllerProvider._();

final class SearchControllerProvider extends $NotifierProvider<SearchController, String> {
  SearchControllerProvider._()
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
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SteamPrograms)
final steamProgramsProvider = SteamProgramsProvider._();

final class SteamProgramsProvider extends $AsyncNotifierProvider<SteamPrograms, Iterable<SteamProgram>> {
  SteamProgramsProvider._()
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

String _$steamProgramsHash() => r'fae4d7e970d47b2a7d9c5d30ac70aa8dace266c7';

abstract class _$SteamPrograms extends $AsyncNotifier<Iterable<SteamProgram>> {
  FutureOr<Iterable<SteamProgram>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Iterable<SteamProgram>>, Iterable<SteamProgram>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Iterable<SteamProgram>>, Iterable<SteamProgram>>,
              AsyncValue<Iterable<SteamProgram>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(_ReplacedFilesController)
final _replacedFilesControllerProvider = _ReplacedFilesControllerProvider._();

final class _ReplacedFilesControllerProvider extends $NotifierProvider<_ReplacedFilesController, Set<String>> {
  _ReplacedFilesControllerProvider._()
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

String _$_replacedFilesControllerHash() => r'f701387fd3dca548fecaf909c453be847d29a0ec';

abstract class _$ReplacedFilesController extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<Set<String>, Set<String>>, Set<String>, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(WasFileReplacedController)
final wasFileReplacedControllerProvider = WasFileReplacedControllerFamily._();

final class WasFileReplacedControllerProvider extends $NotifierProvider<WasFileReplacedController, bool> {
  WasFileReplacedControllerProvider._({
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
    return other is WasFileReplacedControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wasFileReplacedControllerHash() => r'69297efee1b523fd9c6bd670bc8a6df416aaaf94';

final class WasFileReplacedControllerFamily extends $Family
    with $ClassFamilyOverride<WasFileReplacedController, bool, bool, bool, String> {
  WasFileReplacedControllerFamily._()
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
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(DownloadableArtworkController)
final downloadableArtworkControllerProvider = DownloadableArtworkControllerFamily._();

final class DownloadableArtworkControllerProvider
    extends $AsyncNotifierProvider<DownloadableArtworkController, DownloadableArtworkState> {
  DownloadableArtworkControllerProvider._({
    required DownloadableArtworkControllerFamily super.from,
    required ({String initialSearchTerm, SteamGridArtType artType}) super.argument,
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
    return other is DownloadableArtworkControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadableArtworkControllerHash() => r'1515038bfd153f75fbfd6bbc35aaa5d490003b79';

final class DownloadableArtworkControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DownloadableArtworkController,
          AsyncValue<DownloadableArtworkState>,
          DownloadableArtworkState,
          FutureOr<DownloadableArtworkState>,
          ({String initialSearchTerm, SteamGridArtType artType})
        > {
  DownloadableArtworkControllerFamily._()
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

abstract class _$DownloadableArtworkController extends $AsyncNotifier<DownloadableArtworkState> {
  late final _$args = ref.$arg as ({String initialSearchTerm, SteamGridArtType artType});
  String get initialSearchTerm => _$args.initialSearchTerm;
  SteamGridArtType get artType => _$args.artType;

  FutureOr<DownloadableArtworkState> build({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DownloadableArtworkState>, DownloadableArtworkState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DownloadableArtworkState>, DownloadableArtworkState>,
              AsyncValue<DownloadableArtworkState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        initialSearchTerm: _$args.initialSearchTerm,
        artType: _$args.artType,
      ),
    );
  }
}

@ProviderFor(downloadFileSize)
final downloadFileSizeProvider = DownloadFileSizeFamily._();

final class DownloadFileSizeProvider extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  DownloadFileSizeProvider._({
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
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

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

final class DownloadFileSizeFamily extends $Family with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  DownloadFileSizeFamily._()
    : super(
        retry: null,
        name: r'downloadFileSizeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadFileSizeProvider call({required String url}) => DownloadFileSizeProvider._(argument: url, from: this);

  @override
  String toString() => r'downloadFileSizeProvider';
}
