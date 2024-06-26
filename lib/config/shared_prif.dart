import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SharedStorage {

  SharedStorage._();

  static final SharedStorage instance = SharedStorage._();

  Future<void> userDetail ({
    required String username,
    required String email,
    required String phone,

}) async{
    await localStorage!.setString("username", username);
    await localStorage!.setString("userEmail", email);
    await localStorage!.setString("userPhone", phone);
  }



  String? get userName => localStorage!.getString("username") ?? "";
  String? get userEmail => localStorage!.getString("userEmail") ?? "";
  String? get userPhone => localStorage!.getString("userPhone") ?? "";



  static SharedPreferences? localStorage;
  static Future init() async => localStorage = await SharedPreferences.getInstance();

}