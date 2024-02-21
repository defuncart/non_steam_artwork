import 'dart:async';
import 'dart:developer' as dev show log;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger.g.dart';

class Logger {
  Logger._() : _logs = <String>[];

  final _controller = StreamController<List<String>>();
  final List<String> _logs;

  Stream<List<String>> get logsStream => _controller.stream;

  void log(String event) {
    _logs.add(event);
    _controller.add(_logs);
    dev.log(event);
  }
}

@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) => Logger._();

@Riverpod(keepAlive: true)
Stream<List<String>> logsViewer(LogsViewerRef ref) => ref.watch(loggerProvider).logsStream;

extension RefExtension on Ref {
  void log(String event) => read(loggerProvider).log(event);
}
