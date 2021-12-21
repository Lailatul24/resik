// To parse this JSON data, do
//
//     final listsetorModel = listsetorModelFromMap(jsonString);

import 'dart:convert';

class ListsetorModel {
  ListsetorModel({
    this.hasil,
    this.message,
  });

  bool? hasil;
  List<Message>? message;

  factory ListsetorModel.fromJson(String str) =>
      ListsetorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListsetorModel.fromMap(Map<String, dynamic> json) => ListsetorModel(
        hasil: json["hasil"],
        message:
            List<Message>.from(json["message"].map((x) => Message.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "hasil": hasil,
        "message": List<dynamic>.from(message!.map((x) => x.toMap())),
      };
}

class Message {
  Message({
    this.id,
    this.namaBankSampah,
    this.namaNasabah,
    this.kode,
    this.status,
    this.setoran,
    this.createdAt,
    this.v,
  });

  String? id;
  BankSampah? namaBankSampah;
  NamaNasabah? namaNasabah;
  String? kode;
  String? status;
  List<Setoran>? setoran;
  DateTime? createdAt;
  int? v;

  factory Message.fromJson(String str) => Message.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        id: json["_id"],
        namaBankSampah: json["NamaBankSampah"] == null
            ? null
            : bankSampahValues.map![json["NamaBankSampah"]],
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
        "NamaBankSampah": namaBankSampah == null
            ? null
            : bankSampahValues.reverse[namaBankSampah],
        "NamaNasabah": namaNasabah!.toMap(),
        "Kode": kode,
        "Status": status,
        "Setoran": List<dynamic>.from(setoran!.map((x) => x.toMap())),
        "CreatedAt": createdAt!.toIso8601String(),
        "__v": v,
      };
}

enum BankSampah { THE_619_B4101_BD99577_CCE661_FDC }

final bankSampahValues = EnumValues(
    {"619b4101bd99577cce661fdc": BankSampah.THE_619_B4101_BD99577_CCE661_FDC});

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
    this.editedAt,
  });

  String? saldo;
  Id? id;
  Username? username;
  Fullname? fullname;
  Email? email;
  Password? password;
  String? nomorTelpon;
  Foto? foto;
  TanggalLahir? tanggalLahir;
  String? usia;
  JenisKelamin? jenisKelamin;
  int? status;
  Provinsi? provinsi;
  Kota? kota;
  Kecamatan? kecamatan;
  Desa? desa;
  BankSampah? bankSampah;
  DateTime? createdAt;
  CreatedBy? createdBy;
  int? v;
  DateTime? editedAt;

  factory NamaNasabah.fromJson(String str) =>
      NamaNasabah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NamaNasabah.fromMap(Map<String, dynamic> json) => NamaNasabah(
        saldo: json["Saldo"],
        id: idValues.map![json["_id"]],
        username: usernameValues.map![json["Username"]],
        fullname: fullnameValues.map![json["Fullname"]],
        email: emailValues.map![json["Email"]],
        password: passwordValues.map![json["Password"]],
        nomorTelpon: json["NomorTelpon"],
        foto: fotoValues.map![json["Foto"]],
        tanggalLahir: tanggalLahirValues.map![json["TanggalLahir"]],
        usia: json["Usia"],
        jenisKelamin: jenisKelaminValues.map![json["JenisKelamin"]],
        status: json["Status"],
        provinsi: provinsiValues.map![json["Provinsi"]],
        kota: kotaValues.map![json["Kota"]],
        kecamatan: kecamatanValues.map![json["Kecamatan"]],
        desa: desaValues.map![json["Desa"]],
        bankSampah: bankSampahValues.map![json["BankSampah"]],
        createdAt: DateTime.parse(json["CreatedAt"]),
        createdBy: createdByValues.map![json["CreatedBy"]],
        v: json["__v"],
        editedAt:
            json["EditedAt"] == null ? null : DateTime.parse(json["EditedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "Saldo": saldo,
        "_id": idValues.reverse[id],
        "Username": usernameValues.reverse[username],
        "Fullname": fullnameValues.reverse[fullname],
        "Email": emailValues.reverse[email],
        "Password": passwordValues.reverse[password],
        "NomorTelpon": nomorTelpon,
        "Foto": fotoValues.reverse[foto],
        "TanggalLahir": tanggalLahirValues.reverse[tanggalLahir],
        "Usia": usia,
        "JenisKelamin": jenisKelaminValues.reverse[jenisKelamin],
        "Status": status,
        "Provinsi": provinsiValues.reverse[provinsi],
        "Kota": kotaValues.reverse[kota],
        "Kecamatan": kecamatanValues.reverse[kecamatan],
        "Desa": desaValues.reverse[desa],
        "BankSampah": bankSampahValues.reverse[bankSampah],
        "CreatedAt": createdAt!.toIso8601String(),
        "CreatedBy": createdByValues.reverse[createdBy],
        "__v": v,
        "EditedAt": editedAt == null ? null : editedAt!.toIso8601String(),
      };
}

enum CreatedBy { THE_619_B42_A7_CEB7_EEF7_CDAACE89 }

final createdByValues = EnumValues(
    {"619b42a7ceb7eef7cdaace89": CreatedBy.THE_619_B42_A7_CEB7_EEF7_CDAACE89});

enum Desa { THE_619_B3985_BD99577_CCE661_F8_E }

final desaValues = EnumValues(
    {"619b3985bd99577cce661f8e": Desa.THE_619_B3985_BD99577_CCE661_F8_E});

enum Email { NASABAH01_GMAIL_COM, NASABAH05_GMAIL_COM, NASABAH02_GMAIL_COM }

final emailValues = EnumValues({
  "nasabah01@gmail.com": Email.NASABAH01_GMAIL_COM,
  "nasabah02@gmail.com": Email.NASABAH02_GMAIL_COM,
  "nasabah05@gmail.com": Email.NASABAH05_GMAIL_COM
});

enum Foto { EMPTY, IMAGES_NASABAHPHOTOS_1638418957830_JPEG }

final fotoValues = EnumValues({
  "": Foto.EMPTY,
  "/images/nasabahphotos-1638418957830.jpeg":
      Foto.IMAGES_NASABAHPHOTOS_1638418957830_JPEG
});

enum Fullname { AKU_NASABAH_01, AKU_NASABAH_05, AKU_NASABAH_02 }

final fullnameValues = EnumValues({
  "Aku Nasabah 01": Fullname.AKU_NASABAH_01,
  "Aku Nasabah 02": Fullname.AKU_NASABAH_02,
  "Aku Nasabah 05": Fullname.AKU_NASABAH_05
});

enum Id {
  THE_619_B4_CA2_ED708_AC1_C96_DF7_D4,
  THE_61_A8489_C88_BCB2174_F10099_F,
  THE_619_B4_D17_ED708_AC1_C96_DF7_EA
}

final idValues = EnumValues({
  "619b4ca2ed708ac1c96df7d4": Id.THE_619_B4_CA2_ED708_AC1_C96_DF7_D4,
  "619b4d17ed708ac1c96df7ea": Id.THE_619_B4_D17_ED708_AC1_C96_DF7_EA,
  "61a8489c88bcb2174f10099f": Id.THE_61_A8489_C88_BCB2174_F10099_F
});

enum JenisKelamin { LAKI_LAKI }

final jenisKelaminValues = EnumValues({"laki-laki": JenisKelamin.LAKI_LAKI});

enum Kecamatan { THE_606_D2_BC4092_E0000_C600188_A }

final kecamatanValues = EnumValues(
    {"606d2bc4092e0000c600188a": Kecamatan.THE_606_D2_BC4092_E0000_C600188_A});

enum Kota { THE_606_BD13_F42040000_CB006726 }

final kotaValues = EnumValues(
    {"606bd13f42040000cb006726": Kota.THE_606_BD13_F42040000_CB006726});

enum Password {
  THE_2_B_10_V902_F1_NG_EC_DPK7_CK_RGFOT_APP9_V_F8405_P_RQM0_OAMU_UU79_NA2_V_XO,
  THE_2_B_10_X_TZG_JX_QOV6_K_E_ZBSCP_ZTI4_OI9_J_B_EL3_HX0_SB7_ZDWIV_0_YAN_Q_MSD_QNCC,
  THE_2_B_10_P_EW_Q1_TZ3_PMD_RT_UN_X_KXY_G_O_WC_CPP3_UYLH_JK_AJ7_HX1_PUZ5_Q_K_08_V1_E
}

final passwordValues = EnumValues({
  "\u00242b\u002410\u0024PEwQ1Tz3PMDRtUnXKxyG.OWcCPP3uylhJkAj7Hx1Puz5Q/K.08V1e":
      Password
          .THE_2_B_10_P_EW_Q1_TZ3_PMD_RT_UN_X_KXY_G_O_WC_CPP3_UYLH_JK_AJ7_HX1_PUZ5_Q_K_08_V1_E,
  "\u00242b\u002410\u0024v902F1NGEcDpk7CkRGFOT.App9vF8405pRQM0OamuUU79/na2VXo.":
      Password
          .THE_2_B_10_V902_F1_NG_EC_DPK7_CK_RGFOT_APP9_V_F8405_P_RQM0_OAMU_UU79_NA2_V_XO,
  "\u00242b\u002410\u0024xTzgJxQov6kEZbscpZTI4OI9jBEl3hx0sb7Zdwiv.0yanQMsdQNCC":
      Password
          .THE_2_B_10_X_TZG_JX_QOV6_K_E_ZBSCP_ZTI4_OI9_J_B_EL3_HX0_SB7_ZDWIV_0_YAN_Q_MSD_QNCC
});

enum Provinsi { THE_606_A5_A72_FCE39_E2_BF38_B443_E }

final provinsiValues = EnumValues(
    {"606a5a72fce39e2bf38b443e": Provinsi.THE_606_A5_A72_FCE39_E2_BF38_B443_E});

enum TanggalLahir { THE_05_SEPTEMBER_1997, THE_23_OKTOBER_2000 }

final tanggalLahirValues = EnumValues({
  "05-september-1997": TanggalLahir.THE_05_SEPTEMBER_1997,
  "23-Oktober-2000": TanggalLahir.THE_23_OKTOBER_2000
});

enum Username { NASABAH1, NASABAH5, NASABAH2 }

final usernameValues = EnumValues({
  "Nasabah1": Username.NASABAH1,
  "Nasabah2": Username.NASABAH2,
  "Nasabah5": Username.NASABAH5
});

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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
