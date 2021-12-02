// To parse this JSON data, do
//
//     final usersModel = usersModelFromMap(jsonString);

import 'dart:convert';

class UsersModel {
    UsersModel({
        this.hasil,
        this.result,
    });

    bool? hasil;
    List<Result>? result;

    factory UsersModel.fromJson(String str) => UsersModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsersModel.fromMap(Map<String, dynamic> json) => UsersModel(
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
    Kecamatan? provinsi;
    Kecamatan? kota;
    Kecamatan? kecamatan;
    dynamic desa;
    BankSampah? bankSampah;
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
        tanggalLahir: json["TanggalLahir"],
        usia: json["Usia"],
        jenisKelamin: json["JenisKelamin"],
        status: json["Status"],
        provinsi: Kecamatan.fromMap(json["Provinsi"]),
        kota: Kecamatan.fromMap(json["Kota"]),
        kecamatan: Kecamatan.fromMap(json["Kecamatan"]),
        desa: json["Desa"],
        bankSampah: BankSampah.fromMap(json["BankSampah"]),
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
        "TanggalLahir": tanggalLahir,
        "Usia": usia,
        "JenisKelamin": jenisKelamin,
        "Status": status,
        "Provinsi": provinsi?.toMap(),
        "Kota": kota?.toMap(),
        "Kecamatan": kecamatan?.toMap(),
        "Desa": desa,
        "BankSampah": bankSampah?.toMap(),
        "CreatedAt": createdAt?.toIso8601String(),
        "CreatedBy": createdBy,
        "__v": v,
    };
}

class BankSampah {
    BankSampah({
        this.id,
        this.nama,
        this.nomorTelepon,
        this.ketua,
        this.kode,
        this.status,
        this.provinsi,
        this.kota,
        this.kecamatan,
        this.desa,
        this.createdAt,
        this.createdBy,
        this.v,
    });

    String? id;
    String? nama;
    String? nomorTelepon;
    String? ketua;
    String? kode;
    int? status;
    String? provinsi;
    String? kota;
    String? kecamatan;
    String? desa;
    DateTime? createdAt;
    String? createdBy;
    int? v;

    factory BankSampah.fromJson(String str) => BankSampah.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BankSampah.fromMap(Map<String, dynamic> json) => BankSampah(
        id: json["_id"],
        nama: json["Nama"],
        nomorTelepon: json["NomorTelepon"],
        ketua: json["Ketua"],
        kode: json["Kode"],
        status: json["Status"],
        provinsi: json["Provinsi"],
        kota: json["Kota"],
        kecamatan: json["Kecamatan"],
        desa: json["Desa"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        createdBy: json["CreatedBy"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "NomorTelepon": nomorTelepon,
        "Ketua": ketua,
        "Kode": kode,
        "Status": status,
        "Provinsi": provinsi,
        "Kota": kota,
        "Kecamatan": kecamatan,
        "Desa": desa,
        "CreatedAt": createdAt?.toIso8601String(),
        "CreatedBy": createdBy,
        "__v": v,
    };
}

class Kecamatan {
    Kecamatan({
        this.id,
        this.v,
        this.active,
        this.createdAt,
        this.createdBy,
        this.kecamatan,
        this.kode,
        this.kota,
        this.provinsi,
    });

    String? id;
    int? v;
    bool? active;
    DateTime? createdAt;
    String? createdBy;
    String? kecamatan;
    String? kode;
    String? kota;
    String? provinsi;

    factory Kecamatan.fromJson(String str) => Kecamatan.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Kecamatan.fromMap(Map<String, dynamic> json) => Kecamatan(
        id: json["_id"],
        v: json["__v"],
        active: json["Active"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        createdBy: json["CreatedBy"],
        kecamatan: json["Kecamatan"] == null ? null : json["Kecamatan"],
        kode: json["Kode"],
        kota: json["Kota"] == null ? null : json["Kota"],
        provinsi: json["Provinsi"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "__v": v,
        "Active": active,
        "CreatedAt": createdAt?.toIso8601String(),
        "CreatedBy": createdBy,
        "Kecamatan": kecamatan == null ? null : kecamatan,
        "Kode": kode,
        "Kota": kota == null ? null : kota,
        "Provinsi": provinsi,
    };
}
