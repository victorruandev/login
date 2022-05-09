import 'package:dio/dio.dart';

class ClientHttp {
  
  final dio = Dio();

  Future<Map<String, dynamic>> post(String url) async { // GAMBIARRA (DEVE-SE USAR O QUERYPARAMETRS PARA MELHOR CONTROLE!)
    final response = await dio.post(url);
    return response.data;
  }
}
