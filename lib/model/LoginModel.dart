// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    this.hasil,
    this.message,
    this.token,
  });

  bool? hasil;
  String? message;
  String? token;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        hasil: json["hasil"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
        "token": token,
      };
}
