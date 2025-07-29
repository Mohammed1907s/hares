import 'dart:convert';


import 'package:get/get.dart';
import 'package:hares/models/user.dart';
import 'package:hares/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Caching extends GetxService {
  static late SharedPreferences _sharedPreferences;

  Future<Caching> initial() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  static dynamic getAppData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<dynamic> saveAppData(
      {required key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
  }

  static Future<bool> saveUserToken({required String token}) async {
    return await _sharedPreferences.setString(Const.KEY_USER_TOKEN, token);
  }

  static dynamic getUserToken({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<dynamic> saveUserData({ required User user}) async {
    return await _sharedPreferences.setString(Const.KEY_USER_DATA, jsonEncode(user));
  }

  static User getUserData({required String key}) {
    User user = User();
    String? userDataJson = _sharedPreferences.getString(key);
    if (userDataJson != null) {
      user = User.fromJson(jsonDecode(userDataJson));
    }
    return user;
  }

  static Future<bool> saveAppLanguage(
      {required key, required String languageCode}) async {
    return await _sharedPreferences.setString(key, languageCode);
  }

  static dynamic getAppLanguage({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<bool> clearData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await _sharedPreferences.clear();
  }
}
