// To parse this JSON data, do
//
//     final getEcomerce = getEcomerceFromMap(jsonString);

import 'dart:convert';

class GetEcomerce {
  GetEcomerce({
    this.hasil,
    this.result,
  });

  bool? hasil;
  List<Result>? result;

  factory GetEcomerce.fromJson(String str) =>
      GetEcomerce.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetEcomerce.fromMap(Map<String, dynamic> json) => GetEcomerce(
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
    this.produk,
    this.admin,
    this.jumlah,
    this.hargaJual,
    this.createdAt,
    this.v,
  });

  String? id;
  Produk? produk;
  String? admin;
  int? jumlah;
  int? hargaJual;
  DateTime? createdAt;
  int? v;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        produk: Produk.fromMap(json["Produk"]),
        admin: json["Admin"],
        jumlah: json["Jumlah"],
        hargaJual: json["HargaJual"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Produk": produk!.toMap(),
        "Admin": admin,
        "Jumlah": jumlah,
        "HargaJual": hargaJual,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}

class Produk {
  Produk({
    this.id,
    this.nama,
    this.kode,
    this.jenis,
    this.deskripsi,
    this.foto,
    this.status,
    this.createdAt,
    this.v,
  });

  String? id;
  String? nama;
  String? kode;
  String? jenis;
  String? deskripsi;
  String? foto;
  String? status;
  DateTime? createdAt;
  int? v;

  factory Produk.fromJson(String str) => Produk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produk.fromMap(Map<String, dynamic> json) => Produk(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        jenis: json["Jenis"],
        deskripsi: json["Deskripsi"],
        foto: json["Foto"],
        status: json["Status"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Jenis": jenis,
        "Deskripsi": deskripsi,
        "Foto": foto,
        "Status": status,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}
