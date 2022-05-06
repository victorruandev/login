import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user/user_model.dart';
import 'auth_request_models.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  var authRequest = AuthRequestModel('', '');

  var state = AuthState.idle; // estado inicial

  Future<void> loginAction() async {
    state = AuthState.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await Dio().post(
          // 'https://sge-totem.herokuapp.com/login/', http://localhost:8080/auth
          'https://sge-totem.herokuapp.com/login/',
          data: authRequest.toMap());
      final shared = await SharedPreferences.getInstance();
      print(response.data);
      globaUserModel = UserModel.fromMap(jsonDecode(response.data));
      await shared.setString('UserModel', globaUserModel!.toJson());
      state = AuthState.success;
      notifyListeners();
    } catch (e) {
      state = AuthState.error;
      notifyListeners();
    }
  }
}
