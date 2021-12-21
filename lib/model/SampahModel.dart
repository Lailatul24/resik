// To parse this JSON data, do
//
//     final getSampah = getSampahFromMap(jsonString);

import 'dart:convert';

class GetSampah {
  GetSampah({
    this.hasil,
    this.result,
  });

  bool? hasil;
  List<Result>? result;

  factory GetSampah.fromJson(String str) => GetSampah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSampah.fromMap(Map<String, dynamic> json) => GetSampah(
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
    this.hargaSetor,
    this.hargaJual,
    this.foto,
    this.createdAt,
    this.v,
  });

  String? id;
  String? nama;
  String? kode;
  Jenis? jenis;
  String? jumlah;
  int? hargaSetor;
  int? hargaJual;
  String? foto;
  DateTime? createdAt;
  int? v;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        jenis: Jenis.fromMap(json["Jenis"]),
        jumlah: json["Jumlah"],
        hargaSetor: json["HargaSetor"],
        hargaJual: json["HargaJual"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Jenis": jenis!.toMap(),
        "Jumlah": jumlah,
        "HargaSetor": hargaSetor,
        "HargaJual": hargaJual,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}

class Jenis {
  Jenis({
    this.id,
    this.nama,
    this.kode,
    this.foto,
    this.createdAt,
    this.v,
  });

  String? id;
  String? nama;
  String? kode;
  String? foto;
  DateTime? createdAt;
  int? v;

  factory Jenis.fromJson(String str) => Jenis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Jenis.fromMap(Map<String, dynamic> json) => Jenis(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}
