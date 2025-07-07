import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hares/api/api_helper.dart';
import 'package:hares/models/auth/auth.dart';
import 'package:hares/models/auth/logout.dart';
import 'package:hares/models/auth/register.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:http/http.dart' as http;

class APIRequestes {
  static final _client = http.Client();


  static Future<Auth?> login({required String email, required String password}) async {
    var response = await _client.post(Uri.parse(ApiHelper.LOGIN),
    headers: ApiHelper.headers(),
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
    encoding: Encoding.getByName('utf-8'));

    if(response.statusCode == 201 || response.statusCode == 200){
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      log('login SUCCESS: ${jsonEncode(auth)}');
      return auth;
    }else {
      log('login ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Register?> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword
}) async {
    var response = await _client.post(Uri.parse(ApiHelper.REGISTER),
    headers: ApiHelper.headers(),
    body: jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    }),
    encoding: Encoding.getByName('utf-8'));

    if(response.statusCode == 200 || response.statusCode == 201){
      var body = jsonDecode(response.body);
      Register register = Register.fromJson(body);
      log('register SUCCESS: ${jsonEncode(register)}');
      return register;
    }else {
      log('register ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }
  
  static Future<Logout?> logout() async {
    var response = await _client.post(Uri.parse(ApiHelper.LOGOUT),
    headers: ApiHelper.tokenHeader(token: AppHelper.getUserToken()!));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Logout logout = Logout.fromJson(body);
      return logout;
    }else {
      log('logout ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

}
