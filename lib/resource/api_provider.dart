import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resik/model/EcomerceModel.dart';
import 'package:resik/model/LoginModel.dart';
import 'package:resik/model/Produk.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/model/KomentarModel.dart';
import 'package:resik/model/SetorModel.dart';
import 'package:resik/model/UbahPass.dart';
import 'package:resik/model/UsersModel.dart';

class ApiProvider {
  var url = "http://147.139.193.105/resik/v1";

  Future<GetSampah> getSampahId(String token) async {
    var urll = Uri.parse('$url/sampah/listsampah');

    try {
      final res = await http.get(urll, headers: {
        'Authorization': token
      }).timeout(const Duration(seconds: 11));
      // print(res.body);
      if (res.statusCode == 200) {
        return GetSampah.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return GetSampah.fromJson(res.body);
      } else {
        throw Exception('Failur Respon');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future login(BuildContext context, String username, String pass) async {
    var body = jsonEncode({'username': username, 'password': pass});
    var urll = Uri.parse(url + '/nasabah/login');

    try {
      final res = await http
          .post(urll, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return LoginModel.fromJson(res.body);
      } else if (res.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal Login')),
        );
        return LoginModel.fromJson(res.body);
      } else {
        throw Exception("Failur Respons!");
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future produk() async {
    var url = Uri.parse("");

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));

      if (res.statusCode == 200) {
        return Produk.fromJson(res.body);
      } else if (res.statusCode == 400) {
        return Produk.fromJson(res.body);
      } else {
        throw Exception("Failur Response");
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future ubahPass(BuildContext context, String passBaru, String passLama, token) async {
    var body = jsonEncode({'passwordLama': passLama, 'passwordBaru': passBaru});
    var urll = Uri.parse(url + '/nasabah/editpassword');

    try {
      final res = await http
          .post(urll,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return UbahPassword.fromJson(res.body);
      } else if (res.statusCode == 400) {
        return UbahPassword.fromJson(res.body);
      } else {
        throw Exception("Failur Respons!");
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future komentar(BuildContext context, String komentar, token) async {
    var body = jsonEncode({'komentar': komentar});
    var urll = Uri.parse(url + '/komentar/add');

    try {
      final res = await http
          .post(urll,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('FeedBack anda sudah Dikirim')),
        );
        return KomentarModel.fromJson(res.body);
      } else if (res.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal Mengirim Feedback')),
        );
        return KomentarModel.fromJson(res.body);
      } else {
        throw Exception("Failur Respons!");
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future setor(BuildContext context, String banksampah, String username,
      List detailSetor, String token) async {
    var body = jsonEncode({
      'banksampah': banksampah,
      'username': username,
      'penyetoran': detailSetor
    });
    var urll = Uri.parse(url + '/setorsampah/setor');

    try {
      final res = await http
          .post(urll,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': token
              },
              body: body)
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return SetorSampah.fromJson(res.body);
      } else if (res.statusCode == 400) {
        return SetorSampah.fromJson(res.body);
      } else {
        throw Exception("Failur Respons!");
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
  Future users(BuildContext context,token) async {
    var urll = Uri.parse(url + '/nasabah/get');

    try {
      final res = await http
          .post(urll, headers: {
            'Content-Type': 'application/json',
            'Authorization': token
          })
          .timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return UsersModel.fromJson(res.body);
      } else if (res.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data tidak ada')),
        );
        return UsersModel.fromJson(res.body);
      } else {
        throw Exception("Failur Respons!");
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
  Future getEcomerce(BuildContext context) async {
    var urll = Uri.parse(url + '/produk/listproduk');

    try {
      final res = await http.get(urll).timeout(const Duration(seconds: 11));
      // print(res.body);
      if (res.statusCode == 200) {
        return GetEcomerce.fromJson(res.body);
      } else if (res.statusCode == 400) {
        return GetEcomerce.fromJson(res.body);
      } else {
        throw Exception('Failur Respon');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}
