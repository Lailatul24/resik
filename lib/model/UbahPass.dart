// To parse this JSON data, do
//
//     final ubahPassword = ubahPasswordFromMap(jsonString);

import 'dart:convert';

class UbahPassword {
  UbahPassword({
    this.hasil,
    this.message,
  });

  bool? hasil;
  String? message;

  factory UbahPassword.fromJson(String str) =>
      UbahPassword.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UbahPassword.fromMap(Map<String, dynamic> json) => UbahPassword(
        hasil: json["hasil"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
      };
}
