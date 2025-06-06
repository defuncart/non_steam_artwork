import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:meta/meta.dart' as meta;

part 'steam_program.freezed.dart';

enum SteamProgramType { lutris, heroic, roms, other }

@freezed
@meta.immutable
sealed class SteamProgram with _$SteamProgram {
  const factory SteamProgram({
    required int appId,
    required String appName,
    required SteamProgramType programType,
    required DateTime lastPlayed,
    File? icon,
    File? cover,
    File? hero,
    File? logo,
    File? banner,
  }) = _SteamProgram;
}
