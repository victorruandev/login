// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_start/src/shared/services/client_http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/user/user_model.dart';
import '../../shared/models/auth/auth_request_models.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  var authRequest = AuthRequestModel('', '');

  var state = AuthState.idle; // estado inicial

  final ClientHttp client;

  AuthController(this.client); // injeção de dependência

  Future<void> loginAction() async {
    state = AuthState.loading;
    notifyListeners();

    final String codOperator = authRequest.operatorCode;
    final String password = authRequest.password;
    String url = "https://sge-totem.herokuapp.com/login-post/$codOperator-$password";
    // await Future.delayed(const Duration(seconds: 2));
    try {
      //404
      final response2 = await client.post(url);
      final shared = await SharedPreferences.getInstance();
      // globaUserModel = UserModel.fromMap(response2);
      // await shared.setString('UserModel', globaUserModel!.toJson());
      state = AuthState.success;
      notifyListeners();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      state = AuthState.error;
      notifyListeners();
    }
  }
}
