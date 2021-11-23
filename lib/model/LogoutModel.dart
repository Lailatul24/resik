// To parse this JSON data, do
//
//     final logout = logoutFromMap(jsonString);

import 'dart:convert';

class Logout {
  Logout({
    this.hasil,
    this.message,
  });

  bool? hasil;
  String? message;

  factory Logout.fromJson(String str) => Logout.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Logout.fromMap(Map<String, dynamic> json) => Logout(
        hasil: json["hasil"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
      };
}
