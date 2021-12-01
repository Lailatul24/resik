// To parse this JSON data, do
//
//     final setorSampah = setorSampahFromMap(jsonString);

import 'dart:convert';

class SetorSampah {
  SetorSampah({
    this.hasil,
    this.message,
  });

  bool? hasil;
  String? message;

  factory SetorSampah.fromJson(String str) =>
      SetorSampah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SetorSampah.fromMap(Map<String, dynamic> json) => SetorSampah(
        hasil: json["hasil"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
      };
}
