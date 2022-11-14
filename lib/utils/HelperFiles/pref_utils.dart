//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/LoginScreen/models/login_response_model.dart';



class PrefUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool?>? putObject(String key, Object value) async {
    var prefs = await _instance;

    if (prefs == null) return null;
    return prefs.setString(key, json.encode(value));
  }

  static Future<LoginResponseModel?> getLoginModelData(String key) async {
    var prefs = await _instance;
    String? _data = prefs.getString(key);
    return (_data == null || _data.isEmpty)
        ? null
        : LoginResponseModel.fromJson(jsonDecode(_data));
  }


  static Future<bool>? clear() {
    if (_prefsInstance == null) return null;
    return _prefsInstance!.clear();
  }
}
