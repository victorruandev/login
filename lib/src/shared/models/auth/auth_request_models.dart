import 'dart:convert';

class AuthRequestModel {
  final String operatorCode;
  final String password;

  AuthRequestModel(this.operatorCode, this.password);

  AuthRequestModel copyWith({String? operatorCode, String? password}) {
    return AuthRequestModel(
      operatorCode ?? this.operatorCode,
      password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'operatorCode': operatorCode,
      'password': password,
    };
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthRequestModel(
      map['operatorCode'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestModel.fromJson(String source) =>
      AuthRequestModel.fromMap(json.decode(source));
}