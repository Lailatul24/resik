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
        this.editedAt,
        this.v,
        this.status,
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
    String? editedAt;
    int? v;
    int? status;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        jenis: Jenis.fromMap(json["Jenis"]),
        jumlah: json["Jumlah"],
        hargaSetor: json["HargaSetor"] == null ? null : json["HargaSetor"],
        hargaJual: json["HargaJual"] == null ? null : json["HargaJual"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        editedAt: json["EditedAt"] == null ? null : json["EditedAt"],
        v: json["__v"],
        status: json["Status"] == null ? null : json["Status"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Jenis": jenis!.toMap(),
        "Jumlah": jumlah,
        "HargaSetor": hargaSetor == null ? null : hargaSetor,
        "HargaJual": hargaJual == null ? null : hargaJual,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "EditedAt": editedAt == null ? null : editedAt,
        "__v": v,
        "Status": status == null ? null : status,
    };
}

class Jenis {
    Jenis({
        this.id,
        this.nama,
        this.kode,
        this.foto,
        this.createdAt,
        this.editedAt,
        this.v,
    });

    String? id;
    String? nama;
    String? kode;
    String? foto;
    DateTime? createdAt;
    String? editedAt;
    int? v;

    factory Jenis.fromJson(String str) => Jenis.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Jenis.fromMap(Map<String, dynamic> json) => Jenis(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        editedAt: json["EditedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "EditedAt": editedAt,
        "__v": v,
    };
}
