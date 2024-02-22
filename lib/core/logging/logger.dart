import 'dart:async';
import 'dart:developer' as dev show log;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger.g.dart';

class Logger {
  Logger._() : _logs = <LogEvent>[];

  final _controller = StreamController<List<LogEvent>>();
  final List<LogEvent> _logs;

  Stream<List<LogEvent>> get logsStream => _controller.stream;

  void log(String message) {
    final event = _createEvent(message);
    _logs.add(event);
    _controller.add(_logs);
    dev.log('${event.className}: $message');

    // in debug mode log a clickable link to source file @ line number
    if (kDebugMode) {
      final path = p.join(
        Directory.current.path,
        event.sourceFile?.replaceFirst('package:non_steam_artwork/', 'lib/'),
      );
      dev.log('file://$path:${event.lineNumber}');
    }
  }

  LogEvent _createEvent(String message) {
    String? className;
    String? methodName;
    String? sourceFile;
    String? lineNumber;

    final traceRegEx = RegExp(r'(\w*)\.(\w*).* \((.*)\:(\d*\:\d*)\)');
    final lines = StackTrace.current.toString().split('\n');
    if (lines.length > 1) {
      var i = 0;
      do {
        final line = lines[i];
        if (!line.contains('logger.dart')) {
          if (traceRegEx.hasMatch(line)) {
            final match = traceRegEx.allMatches(line).first;
            className = match.group(1);
            methodName = match.group(2);
            sourceFile = match.group(3);
            lineNumber = match.group(4);
            break;
          }
        }
        i++;
      } while (i < lines.length);
    }

    return (
      message: message,
      className: className,
      methodName: methodName,
      sourceFile: sourceFile,
      lineNumber: lineNumber,
    );
  }
}

typedef LogEvent = ({
  String message,
  String? className,
  String? methodName,
  String? sourceFile,
  String? lineNumber,
});

@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) => Logger._();

@Riverpod(keepAlive: true)
Stream<List<LogEvent>> logsViewer(LogsViewerRef ref) => ref.watch(loggerProvider).logsStream;

extension RefExtension on Ref {
  void log(String event) => read(loggerProvider).log(event);
}

extension WidgetRefExtension on WidgetRef {
  void log(String event) => read(loggerProvider).log(event);
}
