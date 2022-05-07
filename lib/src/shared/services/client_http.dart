import 'dart:convert';

import 'package:dio/dio.dart';

class ClientHttp {
  final dio = Dio();

  // Future<Map<String, dynamic>> post(String url) async {
  //   // String userPass = [user, password].join("-");
  //   // String newUrl = [url, userPass].join();
  //   final response = await dio.post(url);
  //   return response.data;
  // }
  Future<Map<String, dynamic>> post(String url, {Map? data}) async {
    final response = await dio.post(url, data:data);
    return response.data;
  }
}
