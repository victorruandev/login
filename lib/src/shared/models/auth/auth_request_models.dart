import 'dart:convert';

class AuthRequestModel {
  final String user;
  final String password;

  AuthRequestModel(this.user, this.password);

  AuthRequestModel copyWith({String? user, String? password}) {
    return AuthRequestModel(
      user ?? this.user,
      password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'password': password,
    };
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthRequestModel(
      map['user'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestModel.fromJson(String source) =>
      AuthRequestModel.fromMap(json.decode(source));
}