// To parse this JSON data, do
//
//     final getBanner = getBannerFromMap(jsonString);

import 'dart:convert';

class GetBanner {
  GetBanner({
    this.hasil,
    this.result,
    this.message,
  });

  bool? hasil;
  List<ResultB>? result;
  String? message;

  factory GetBanner.fromJson(String str) => GetBanner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetBanner.fromMap(Map<String, dynamic> json) => GetBanner(
        hasil: json["hasil"],
        result:
            List<ResultB>.from(json["result"].map((x) => ResultB.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "result": List<dynamic>.from(result!.map((x) => x.toMap())),
        "message": message,
      };
}

class ResultB {
  ResultB({
    this.id,
    this.namaAdmin,
    this.kode,
    this.foto1,
    this.status,
    this.createdAt,
    this.v,
    this.editedAt,
  });

  String? id;
  String? namaAdmin;
  String? kode;
  String? foto1;
  String? status;
  DateTime? createdAt;
  int? v;
  DateTime? editedAt;

  factory ResultB.fromJson(String str) => ResultB.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultB.fromMap(Map<String, dynamic> json) => ResultB(
        id: json["_id"],
        namaAdmin: json["NamaAdmin"],
        kode: json["Kode"],
        foto1: json["Foto"],
        status: json["Status"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        v: json["__v"],
        editedAt: DateTime.parse(json["EditedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "NamaAdmin": namaAdmin,
        "Kode": kode,
        "Foto": foto1,
        "Status": status,
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
        "EditedAt": editedAt!.toIso8601String(),
      };
}
