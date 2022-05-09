
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// UserModel? globaUserModel;

class UserModel with ChangeNotifier{
  final String operatorName;
  final String cashierCode;
  // final String token;

  UserModel({
    required this.operatorName,
    required this.cashierCode,
    // required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'operatorName': operatorName,
      'cashierCode': cashierCode,
      // 'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      operatorName: map['operatorName'],
      cashierCode: map['cashierCode'],
      // token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());
}
