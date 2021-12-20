// To parse this JSON data, do
//
//     final komentarModel = komentarModelFromMap(jsonString);

import 'dart:convert';

class KomentarModel {
    KomentarModel({
        this.hasil,
        this.message,
    });

    bool? hasil;
    String? message;

    factory KomentarModel.fromJson(String str) => KomentarModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory KomentarModel.fromMap(Map<String, dynamic> json) => KomentarModel(
        hasil: json["hasil"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
    };
}
