import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:test_axles/models/seals_model.dart';
import 'package:test_axles/setting/globalvar.dart' as global;


class ApiProvider  {
  final Dio _dio = Dio();
  late var _url = global.urlVar;
  bool refresh = true;

  Future<void> addCache() async {
    _dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl:_url)).interceptor);
  }


  Future<Objects> fetchSealsList() async {
    try {
      await addCache();
      Response response = await _dio.get(_url, options: buildCacheOptions(
        Duration(days: 7),
        forceRefresh: refresh, //to force refresh
        maxStale: Duration(days: 10), //before this time, if error like
        //500, 500 happens, it will return cache
      ));
      return Objects.fromJson(response.data);
    } catch (error, stacktrace) {
      return Objects.withError(" ");
    }
  }
}
