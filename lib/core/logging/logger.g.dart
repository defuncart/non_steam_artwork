// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logger)
final loggerProvider = LoggerProvider._();

final class LoggerProvider extends $FunctionalProvider<Logger, Logger, Logger> with $Provider<Logger> {
  LoggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggerHash();

  @$internal
  @override
  $ProviderElement<Logger> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  Logger create(Ref ref) {
    return logger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Logger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Logger>(value),
    );
  }
}

String _$loggerHash() => r'79c0d5c2da63f5684b297a70f7839110c31c391f';

@ProviderFor(logsViewer)
final logsViewerProvider = LogsViewerProvider._();

final class LogsViewerProvider
    extends $FunctionalProvider<AsyncValue<List<LogEvent>>, List<LogEvent>, Stream<List<LogEvent>>>
    with $FutureModifier<List<LogEvent>>, $StreamProvider<List<LogEvent>> {
  LogsViewerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsViewerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsViewerHash();

  @$internal
  @override
  $StreamProviderElement<List<LogEvent>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<LogEvent>> create(Ref ref) {
    return logsViewer(ref);
  }
}

String _$logsViewerHash() => r'6b2c13567ba46cf1bfffb1fbd29ac2a6693d0d40';
