// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_start/src/shared/services/client_http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user/user_model.dart';
import 'auth_request_models.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  var authRequest = AuthRequestModel('', '');

  var state = AuthState.idle; // estado inicial

  final ClientHttp client;

  AuthController(this.client); // injeção de dependência

  Future<void> loginAction() async {
    state = AuthState.loading;
    notifyListeners();
    // final String url = "https://sge-totem.herokuapp.com/login-post/${authRequest.user}-${authRequest.password}"; - GAMBIARRA FUNCIONAL!
    final String user = authRequest.user;
    final String password = authRequest.password;
    final String url =
        "https://sge-totem.herokuapp.com/login-post/";
    // await Future.delayed(const Duration(seconds: 2));

    // try {
    //   // final response = await Dio().get(
    //   //     "https://sge-totem.herokuapp.com/login/${authRequest.user}-${authRequest.password}",
    //   //     queryParameters: {
    //   //       "codeOperator": authRequest.user,
    //   //       "password": authRequest.password,
    //   //     }
    //   final response = await Dio()
    //       .get("https://sge-totem.herokuapp.com/login-post/", queryParameters: {
    //     "codeOperator": authRequest.user,
    //     "password": authRequest.password,
    //   }
    //           // ${authRequest.user}-${authRequest.password}
    //           );
    try {
      //404
      // final response2 = await client.post(url);
      final response2 = await client.post(url, data: authRequest.toMap());
      final shared = await SharedPreferences.getInstance();
      globaUserModel = UserModel.fromMap(response2);
      await shared.setString('UserModel', globaUserModel!.toJson());
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
    // print(response.data);
    // final shared = await SharedPreferences.getInstance();
    // // globaUserModel = UserModel.fromMap(response2.data);
    // await shared.setString('UserModel', globaUserModel!.toJson());
    // state = AuthState.success;
    // notifyListeners();
    // } catch (e) {
    //   state = AuthState.error;
    //   notifyListeners();
    // }
  }
}
