import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class SteamGridIdCache {
  @visibleForTesting
  static const key = 'SteamGridIdCache';

  SteamGridIdCache({
    required Logger logger,
  }) : _logger = logger;

  final Logger _logger;
  late Map<String, dynamic> _cache;
  late File _cacheFile;

  Future<void> init() async {
    final cachePath = (await getApplicationCacheDirectory()).path;
    _cacheFile = File(p.join(cachePath, '$key.json'));
    if (await _cacheFile.exists()) {
      final contents = await _cacheFile.readAsString();
      try {
        _cache = jsonDecode(contents);
        return;
      } catch (e) {
        _logger.log(e.toString());
      }
    } else {
      _cache = <String, String>{};
      await _persistCacheFile();
    }
  }

  Future<void> _persistCacheFile() => _cacheFile.writeAsString(jsonEncode(_cache));

  String? getIdForSearchTerm(String searchTerm) => _cache[searchTerm];

  void putIdForSearchTerm({
    required String searchTerm,
    required String id,
  }) {
    _logger.log('putIdForSearchTerm id $id searchTerm $searchTerm');
    _cache[searchTerm] = id;
    _persistCacheFile();
  }
}
