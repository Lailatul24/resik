// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

class Login {
  Login({
    this.hasil,
    this.message,
    this.token,
  });

  bool? hasil;
  String? message;
  String? token;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
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
