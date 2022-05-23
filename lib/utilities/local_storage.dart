import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<void> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
