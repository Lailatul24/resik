import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resik/model/SampahModel.dart';

class ApiProvider {
  var uri = "https://banksampahpasuruan.com/banksampah_ws/restapi";

  Future<GetSampah> getSampahId(String idDesa) async {
    var body = jsonEncode({'id_desa': idDesa});
    var url = Uri.parse('$uri/C_sampah/get_sampah');

    try {
      final res = await http
          .post(url,
              headers: {
                'Content-Type': 'application/json',
              },
              body: body)
          .timeout(const Duration(seconds: 11));

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
}
