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
    this.sampah,
    this.jumlah,
    this.hargaSetor,
    this.hargaJual,
    this.createdAt,
    this.v,
  });

  String? id;
  Sampah? sampah;
  int? jumlah;
  int? hargaSetor;
  int? hargaJual;
  DateTime? createdAt;
  int? v;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        sampah: Sampah.fromMap(json["Sampah"]),
        jumlah: json["Jumlah"],
        hargaSetor: json["HargaSetor"],
        hargaJual: json["HargaJual"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Sampah": sampah!.toMap(),
        "Jumlah": jumlah,
        "HargaSetor": hargaSetor,
        "HargaJual": hargaJual,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}

class Sampah {
  Sampah({
    this.id,
    this.nama,
    this.kode,
    this.jenis,
    this.status,
    this.foto,
    this.createdAt,
    this.v,
  });

  String? id;
  String? nama;
  String? kode;
  String? jenis;
  int? status;
  String? foto;
  DateTime? createdAt;
  int? v;

  factory Sampah.fromJson(String str) => Sampah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sampah.fromMap(Map<String, dynamic> json) => Sampah(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        jenis: json["Jenis"],
        status: json["Status"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Jenis": jenis,
        "Status": status,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}
