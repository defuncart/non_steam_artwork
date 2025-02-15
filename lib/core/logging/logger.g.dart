// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggerHash() => r'79c0d5c2da63f5684b297a70f7839110c31c391f';

/// See also [logger].
@ProviderFor(logger)
final loggerProvider = Provider<Logger>.internal(
  logger,
  name: r'loggerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$loggerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoggerRef = ProviderRef<Logger>;
String _$logsViewerHash() => r'6b2c13567ba46cf1bfffb1fbd29ac2a6693d0d40';

/// See also [logsViewer].
@ProviderFor(logsViewer)
final logsViewerProvider = StreamProvider<List<LogEvent>>.internal(
  logsViewer,
  name: r'logsViewerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$logsViewerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LogsViewerRef = StreamProviderRef<List<LogEvent>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
