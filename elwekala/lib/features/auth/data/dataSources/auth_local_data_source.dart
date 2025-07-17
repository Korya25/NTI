import 'package:elwekala/core/cache/cache_helper.dart';
import 'package:elwekala/core/cache/cache_keys.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  String? getCachedToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final CacheHelper cacheHelper;

  AuthLocalDataSourceImpl({required this.cacheHelper});

  @override
  Future<void> cacheToken(String token) async {
    await cacheHelper.saveData(key: CacheKeys.token, value: token);
  }

  @override
  String? getCachedToken() {
    return cacheHelper.getDataString(key: CacheKeys.token);
  }

  @override
  Future<void> clearToken() async {
    await cacheHelper.removeData(key: CacheKeys.token);
  }
}
