import 'dart:convert';
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
    LogoPosition? logoPosition,
    File? banner,
  }) = _SteamProgram;
}

@freezed
@meta.immutable
sealed class LogoPosition with _$LogoPosition {
  const factory LogoPosition({required LogoPositionType position, required double width, required double height}) =
      _LogoPosition;
}

sealed class LogoPositionUtils {
  LogoPositionUtils._();

  static Future<LogoPosition?> readFromFile(File? file) async {
    if (file != null) {
      final jsonAsString = await file.readAsString();
      final jsonData = jsonDecode(jsonAsString);

      try {
        return LogoPositionUtils.fromJson(jsonData);
      } catch (_) {}
    }

    return null;
  }

  @visibleForTesting
  static LogoPosition? fromJson(Map<String, dynamic> jsonData) {
    final position = (jsonData['logoPosition']['pinnedPosition'] as String).fromJson();
    final width = (jsonData['logoPosition']['nWidthPct'] as num).toDouble();
    final height = (jsonData['logoPosition']['nHeightPct'] as num).toDouble();

    return LogoPosition(position: position, width: width, height: height);
  }
}

extension LogoPositionExtensions on LogoPosition {
  Future<void> saveToDisk(String path) async {
    final jsonData = {
      'nVersion': 1,
      'logoPosition': {'pinnedPosition': position.toJson(), 'nWidthPct': width, 'nHeightPct': height},
    };
    final jsonAsString = jsonEncode(jsonData);
    await File(path).writeAsString(jsonAsString);
  }
}

enum LogoPositionType { bottomLeft, upperCenter, centerCenter, bottomCenter }

extension on String {
  LogoPositionType fromJson() => switch (this) {
    'BottomLeft' => LogoPositionType.bottomLeft,
    'UpperCenter' => LogoPositionType.upperCenter,
    'CenterCenter' => LogoPositionType.centerCenter,
    'BottomCenter' => LogoPositionType.bottomCenter,
    _ => throw ArgumentError(),
  };
}

extension on LogoPositionType {
  String toJson() => switch (this) {
    LogoPositionType.bottomLeft => 'BottomLeft',
    LogoPositionType.upperCenter => 'UpperCenter',
    LogoPositionType.centerCenter => 'CenterCenter',
    LogoPositionType.bottomCenter => 'BottomCenter',
  };
}
