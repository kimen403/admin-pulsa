import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//NOTE - This is a simple cache class that can be used to cache json data

class JsonCache {
  late SharedPreferences _prefs;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setCache(String key, data, Duration expireDuration) async {
    await _init();

    final cacheData = {
      'data': jsonEncode(data),
      'expireTime': DateTime.now().add(expireDuration).millisecondsSinceEpoch,
    };

    final cacheDataJson = jsonEncode(cacheData);
    await _prefs.setString(key, cacheDataJson);
  }

  // ignore: avoid_shadowing_type_parameters
  Future<dynamic> getCache(String key) async {
    await _init();
    final cacheData = _prefs.getString(key);
    if (cacheData != null) {
      final cacheJson = jsonDecode(cacheData);
      final expireTime = cacheJson['expireTime'] as int?;

      if (expireTime != null &&
          DateTime.now().millisecondsSinceEpoch < expireTime) {
        final jsonData = cacheJson['data'];

        return jsonDecode(jsonData);
      } else {
        await _prefs.remove(key);
      }
    }
    return null;
  }

  Future<void> removeCache(String key) async {
    await _init();
    await _prefs.remove(key);
  }
}

// Example usage with a custom dat
