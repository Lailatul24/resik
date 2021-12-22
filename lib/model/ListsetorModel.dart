// To parse this JSON data, do
//
//     final listsetorModel = listsetorModelFromMap(jsonString);

import 'dart:convert';

class ListsetorModel {
  ListsetorModel({
    this.hasil,
    this.message,
    this.result,
  });

  bool? hasil;
  String? message;
  List<Result>? result;

  factory ListsetorModel.fromJson(String str) =>
      ListsetorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListsetorModel.fromMap(Map<String, dynamic> json) => ListsetorModel(
        hasil: json["hasil"],
        message: json["message"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.namaNasabah,
    this.kode,
    this.status,
    this.setoran,
    this.createdAt,
    this.v,
  });

  String? id;
  NamaNasabah? namaNasabah;
  String? kode;
  String? status;
  List<Setoran>? setoran;
  DateTime? createdAt;
  int? v;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        namaNasabah: NamaNasabah.fromMap(json["NamaNasabah"]),
        kode: json["Kode"],
        status: json["Status"],
        setoran:
            List<Setoran>.from(json["Setoran"].map((x) => Setoran.fromMap(x))),
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "NamaNasabah": namaNasabah!.toMap(),
        "Kode": kode,
        "Status": status,
        "Setoran": List<dynamic>.from(setoran!.map((x) => x.toMap())),
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}

class NamaNasabah {
  NamaNasabah({
    this.saldo,
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.password,
    this.nomorTelpon,
    this.foto,
    this.tanggalLahir,
    this.usia,
    this.jenisKelamin,
    this.status,
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.desa,
    this.bankSampah,
    this.createdAt,
    this.createdBy,
    this.v,
  });

  String? saldo;
  String? id;
  String? username;
  String? fullname;
  String? email;
  String? password;
  String? nomorTelpon;
  String? foto;
  String? tanggalLahir;
  String? usia;
  String? jenisKelamin;
  int? status;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? desa;
  String? bankSampah;
  DateTime? createdAt;
  String? createdBy;
  int? v;

  factory NamaNasabah.fromJson(String str) =>
      NamaNasabah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NamaNasabah.fromMap(Map<String, dynamic> json) => NamaNasabah(
        saldo: json["Saldo"],
        id: json["_id"],
        username: json["Username"],
        fullname: json["Fullname"],
        email: json["Email"],
        password: json["Password"],
        nomorTelpon: json["NomorTelpon"],
        foto: json["Foto"],
        tanggalLahir: json["TanggalLahir"],
        usia: json["Usia"],
        jenisKelamin: json["JenisKelamin"],
        status: json["Status"],
        provinsi: json["Provinsi"],
        kota: json["Kota"],
        kecamatan: json["Kecamatan"],
        desa: json["Desa"],
        bankSampah: json["BankSampah"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        createdBy: json["CreatedBy"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "Saldo": saldo,
        "_id": id,
        "Username": username,
        "Fullname": fullname,
        "Email": email,
        "Password": password,
        "NomorTelpon": nomorTelpon,
        "Foto": foto,
        "TanggalLahir": tanggalLahir,
        "Usia": usia,
        "JenisKelamin": jenisKelamin,
        "Status": status,
        "Provinsi": provinsi,
        "Kota": kota,
        "Kecamatan": kecamatan,
        "Desa": desa,
        "BankSampah": bankSampah,
        "CreatedAt": createdAt!.toIso8601String(),
        "CreatedBy": createdBy,
        "__v": v,
      };
}

class Setoran {
  Setoran({
    this.sampah,
    this.jumlah,
    this.harga,
    this.total,
    this.id,
  });

  String? sampah;
  int? jumlah;
  int? harga;
  int? total;
  String? id;

  factory Setoran.fromJson(String str) => Setoran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Setoran.fromMap(Map<String, dynamic> json) => Setoran(
        sampah: json["sampah"],
        jumlah: json["jumlah"],
        harga: json["harga"],
        total: json["total"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "sampah": sampah,
        "jumlah": jumlah,
        "harga": harga,
        "total": total,
        "_id": id,
      };
}
