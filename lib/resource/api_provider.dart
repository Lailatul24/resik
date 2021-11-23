import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resik/model/LoginModel.dart';
import 'package:resik/model/Produk.dart';
import 'package:resik/model/SampahModel.dart';

class ApiProvider {
  var uri = "https://banksampahpasuruan.com/banksampah_ws/restapi";
  var url = "http://147.139.193.105/resik/v1";

  Future<GetSampah> getSampahId(String idDesa) async {
    var body = jsonEncode({'id_desa': idDesa});
    var url = Uri.parse('$uri/C_sampah/get_sampah');

    try {
      final res =
          await http.post(url, body: body).timeout(const Duration(seconds: 11));
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Anda Berhasil Login!')),
        );
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

  Future ubahPass(BuildContext context, String user, String passBaru,
      String passLama) async {
    var body = jsonEncode(
        {'username': user, 'passwordLama': passLama, 'passwordBaru': passBaru});
    var urll = Uri.parse(url + '/nasabah/editpassword');

    try {
      final res = await http
          .post(urll, body: body)
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Anda Berhasil Login!')),
        );
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
}
