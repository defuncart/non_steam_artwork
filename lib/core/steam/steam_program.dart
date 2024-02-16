import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:meta/meta.dart' as meta;

part 'steam_program.freezed.dart';

@freezed
@meta.immutable
class SteamProgram with _$SteamProgram {
  const factory SteamProgram({
    required int appId,
    required String appName,
    File? icon,
    File? cover,
    File? background,
    File? logo,
    File? hero,
  }) = _SteamProgram;
}
