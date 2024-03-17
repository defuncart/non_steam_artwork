// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.24.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:meta/meta.dart' as meta;
part 'simple.freezed.dart';

Future<List<SteamShortcut>> parse({required String path, dynamic hint}) =>
    RustLib.instance.api.parse(path: path, hint: hint);

@freezed
@meta.immutable
class SteamShortcut with _$SteamShortcut {
  const factory SteamShortcut({
    required int appId,
    required String appName,
    required String target,
    required String launchOptions,
    required String startDir,
    required String icon,
    required bool isHidden,
    required List<String> tags,
  }) = _SteamShortcut;
}
