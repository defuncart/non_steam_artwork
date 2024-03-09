import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:steamgriddb/steamgriddb.dart';

part 'state.g.dart';

@riverpod
SteamGridDB steamGridDBClient(SteamGridDBClientRef ref) {
  final apiKey = ref.watch(steamGridDBApiKeyControllerProvider);
  // TODO test
  final dio = Dio()
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          maxStale: const Duration(days: 7),
        ),
      ),
    );

  return SteamGridDB(apiKey ?? '', dio: dio);
}
