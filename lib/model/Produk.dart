// To parse this JSON data, do
//
//     final produk = produkFromMap(jsonString);

import 'dart:convert';

class Produk {
  Produk({
    this.hasil,
    this.result,
  });

  bool? hasil;
  List<Result>? result;

  factory Produk.fromJson(String str) => Produk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produk.fromMap(Map<String, dynamic> json) => Produk(
        hasil: json["hasil"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "result": List<dynamic>.from(result!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.nama,
    this.kode,
    this.jenis,
    this.jumlah,
    this.berat,
    this.hargaJual,
    this.deskripsi,
    this.foto,
    this.createdAt,
    this.v,
  });

  String? id;
  String? nama;
  String? kode;
  String? jenis;
  String? jumlah;
  String? berat;
  double? hargaJual;
  String? deskripsi;
  String? foto;
  DateTime? createdAt;
  int? v;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        jenis: json["Jenis"],
        jumlah: json["Jumlah"],
        berat: json["Berat"],
        hargaJual: json["HargaJual"].toDouble(),
        deskripsi: json["Deskripsi"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Jenis": jenis,
        "Jumlah": jumlah,
        "Berat": berat,
        "HargaJual": hargaJual,
        "Deskripsi": deskripsi,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}
