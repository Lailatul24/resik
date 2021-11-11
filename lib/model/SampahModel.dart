// To parse this JSON data, do
//
//     final getSampah = getSampahFromMap(jsonString);

import 'dart:convert';

class GetSampah {
  GetSampah({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  List<Datum>? data;
  String? message;

  factory GetSampah.fromJson(String str) => GetSampah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSampah.fromMap(Map<String, dynamic> json) => GetSampah(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.idSampah,
    this.idJenis,
    this.jenisSampah,
    this.namaSampah,
    this.hargaSetor,
    this.hargaJual,
    this.image,
  });

  String? idSampah;
  String? idJenis;
  String? jenisSampah;
  String? namaSampah;
  String? hargaSetor;
  String? hargaJual;
  String? image;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idSampah: json["id_sampah"],
        idJenis: json["id_jenis"],
        jenisSampah: json["jenis_sampah"],
        namaSampah: json["nama_sampah"],
        hargaSetor: json["harga_setor"],
        hargaJual: json["harga_jual"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id_sampah": idSampah,
        "id_jenis": idJenis,
        "jenis_sampah": jenisSampah,
        "nama_sampah": namaSampah,
        "harga_setor": hargaSetor,
        "harga_jual": hargaJual,
        "image": image,
      };
}
