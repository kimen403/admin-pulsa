import 'package:panel_admin_pulsa/common/cache_json.dart';
import 'package:panel_admin_pulsa/common/exception.dart';
import 'package:panel_admin_pulsa/data/datasources/db/database_helper.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<int> deleteAuth();
  Future<int> saveAuth(AuthModel auth);
  Future<String> getToken();
  Future<AuthModel> loginCheck();
  Future<String> getRefreshToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;
  final JsonCache jsonCache;
  final String _jsonCacheKey = 'auth';
  final Duration _cacheDuration = const Duration(days: 365);

  AuthLocalDataSourceImpl(
      {required this.databaseHelper, required this.jsonCache});

  @override
  Future<int> deleteAuth() async {
    await jsonCache.removeCache(_jsonCacheKey);
    return 1;
  }

  @override
  Future<int> saveAuth(AuthModel auth) async {
    await jsonCache.setCache(
      _jsonCacheKey,
      auth.toJson(),
      _cacheDuration,
    );
    return 1;
  }

  @override
  Future<String> getToken() async {
    // print('GET TOKEN LOCAL DATABASE');
    try {
      final json = await jsonCache.getCache(_jsonCacheKey);
      // print('GET TOKEN LOCAL DATABASE JSON $json');
      if (json != null) {
        // print('GET TOKEN LOCAL DATABASE  ${json.runtimeType}');
        final auth = AuthModel.fromJson(json);
        // print('GET TOKEN LOCAL DATABASE  AUTH $auth');
        return auth.token;
      }
    } catch (e) {
      throw CacheException('Data tidak ditemukan');
    }
    throw CacheException('Data tidak ditemukan');
  }

  @override
  Future<AuthModel> loginCheck() async {
    try {
      final json = await jsonCache.getCache(_jsonCacheKey);
      if (json != null && json != '') {
        return AuthModel.fromJson(json);
      }
    } catch (e) {
      // print('ERROR LOGIN CHECK $e');
    }
    throw CacheException('Data tidak ditemukan');
  }

  @override
  Future<String> getRefreshToken() async {
    try {
      final json = await jsonCache.getCache(_jsonCacheKey);
      if (json != null) {
        final auth = AuthModel.fromJson(json);
        return auth.refreshToken;
      }
    } catch (e) {
      print(e);
    }
    throw CacheException('Data tidak ditemukan');
  }
}
