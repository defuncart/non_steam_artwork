import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:non_steam_artwork/features/support/licenses_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_state.g.dart';

@riverpod
Future<bool> splashState(Ref ref) async {
  ref.log('Hive.defaultDirectory: ${Hive.defaultDirectory}');
  await ref.read(steamManagerProvider).init();
  LicensesScreen.initRegistry();

  final deviceInfo = await DeviceInfoPlugin().deviceInfo;
  final packageInfo = await PackageInfo.fromPlatform();

  ref.log(packageInfo.toString());
  ref.log(switch (defaultTargetPlatform) {
    // LinuxDeviceInfo does not override toString
    TargetPlatform.linux => 'DeviceInfo ${deviceInfo.data.toString()}',
    _ => deviceInfo.toString(),
  });

  return true;
}
