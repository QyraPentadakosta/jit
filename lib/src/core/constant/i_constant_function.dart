import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IConstantFunction {
  Future setBool(dynamic key, bool? value) async {
    var pref = await SharedPreferences.getInstance();
    var success = await pref.setBool(key, value!);
    if (kDebugMode) {
      print("Saving $key is $success");
    }
    return success;
  }

  Future<bool> setString(dynamic key, String? value) async {
    var pref = await SharedPreferences.getInstance();
    var success = await pref.setString(key, value ?? "");
    if (kDebugMode) {
      print("Saving $key is $success");
    }
    return success;
  }

  Future<bool> setMap(dynamic key, Map<String, dynamic>? value) async {
    var pref = await SharedPreferences.getInstance();
    var success = await pref.setString(key, jsonEncode(value));
    if (kDebugMode) {
      print("Saving $key is $success");
    }
    return success;
  }

  Future<String?> getString(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    return val;
  }

  Future<Map<String, dynamic>?> getMap(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    return jsonDecode(val ?? "");
  }

  Future<bool?> getBool(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  Future removeAll() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
