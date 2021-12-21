// To parse this JSON data, do
//
//     final jualProduk = jualProdukFromMap(jsonString);

import 'dart:convert';

class JualProduk {
    JualProduk({
        this.hasil,
        this.message,
    });

    bool? hasil;
    String? message;

    factory JualProduk.fromJson(String str) => JualProduk.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JualProduk.fromMap(Map<String, dynamic> json) => JualProduk(
        hasil: json["hasil"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
    };
}
