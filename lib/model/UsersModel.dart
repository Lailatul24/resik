// To parse this JSON data, do
//
//     final usersModel = usersModelFromMap(jsonString);

import 'dart:convert';

class UsersModel {
  UsersModel({
    this.hasil,
    this.message,
    this.result,
  });

  bool? hasil;
  String? message;
  Result? result;

  factory UsersModel.fromJson(String str) =>
      UsersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersModel.fromMap(Map<String, dynamic> json) => UsersModel(
        hasil: json["hasil"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": message,
        "result": result!.toMap(),
      };
}

class Result {
  Result({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.password,
    this.nomorTelpon,
    this.foto,
    this.saldo,
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

  String? id;
  String? username;
  String? fullname;
  String? email;
  String? password;
  String? nomorTelpon;
  String? foto;
  String? saldo;
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

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        username: json["Username"],
        fullname: json["Fullname"],
        email: json["Email"],
        password: json["Password"],
        nomorTelpon: json["NomorTelpon"],
        foto: json["Foto"],
        saldo: json["Saldo"],
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
        "_id": id,
        "Username": username,
        "Fullname": fullname,
        "Email": email,
        "Password": password,
        "NomorTelpon": nomorTelpon,
        "Foto": foto,
        "Saldo": saldo,
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
