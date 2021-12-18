// To parse this JSON data, do
//
//     final getEcomerce = getEcomerceFromMap(jsonString);

import 'dart:convert';

class GetEcomerce {
    GetEcomerce({
        this.hasil,
        this.message,
    });

    bool? hasil;
    List<Message>? message;

    factory GetEcomerce.fromJson(String str) => GetEcomerce.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetEcomerce.fromMap(Map<String, dynamic> json) => GetEcomerce(
        hasil: json["hasil"],
        message: List<Message>.from(json["message"].map((x) => Message.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": List<dynamic>.from(message!.map((x) => x.toMap())),
    };
}

class Message {
    Message({
        this.id,
        this.nama,
        this.kode,
        this.jenis,
        this.jumlah,
        this.hargaJual,
        this.deskripsi,
        this.foto,
        this.createdAt,
        this.v,
    });

    String? id;
    String? nama;
    String? kode;
    Jenis? jenis;
    String? jumlah;
    int? hargaJual;
    String? deskripsi;
    String? foto;
    DateTime? createdAt;
    int? v;

    factory Message.fromJson(String str) => Message.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Message.fromMap(Map<String, dynamic> json) => Message(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        jenis: Jenis.fromMap(json["Jenis"]),
        jumlah: json["Jumlah"],
        hargaJual: json["HargaJual"],
        deskripsi: json["Deskripsi"],
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
        "HargaJual": hargaJual,
        "Deskripsi": deskripsi,
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
        this.editedAt,
    });

    String? id;
    String? nama;
    String? kode;
    String? foto;
    DateTime? createdAt;
    int? v;
    DateTime? editedAt;

    factory Jenis.fromJson(String str) => Jenis.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Jenis.fromMap(Map<String, dynamic> json) => Jenis(
        id: json["_id"],
        nama: json["Nama"],
        kode: json["Kode"],
        foto: json["Foto"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
        editedAt: DateTime.parse(json["EditedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "Nama": nama,
        "Kode": kode,
        "Foto": foto,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
        "EditedAt": editedAt!.toIso8601String(),
    };
}
