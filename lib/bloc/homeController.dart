import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:resik/model/LoginModel.dart';
import 'package:resik/model/Produk.dart';
import 'package:resik/model/KomentarModel.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/resource/repostory.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final repostory = Repostory();

  final _sampahFetchar = PublishSubject<GetSampah>();
  final _produkFetchar = PublishSubject<Produk>();
  final _loginFetchar = PublishSubject<LoginModel>();
  final _komentarFetchar = PublishSubject<KomentarModel>();

  PublishSubject<GetSampah> get resSampah => _sampahFetchar;
  PublishSubject<Produk> get resProduk => _produkFetchar;
  PublishSubject<LoginModel> get resLogin => _loginFetchar;
  PublishSubject<KomentarModel> get resKomentar => _komentarFetchar;

  Future getSampahId(String idDesa) async {
    try {
      GetSampah sampahModel = await repostory.getSampahId(idDesa);
      _sampahFetchar.sink.add(sampahModel);
    } catch (e) {
      print(e.toString());
    }
  }

  Future produk() async {
    try {
      Produk produk = await repostory.produk();
      _produkFetchar.sink.add(produk);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(BuildContext context, String username, String pass) async {
    try {
      LoginModel login = await repostory.login(context, username, pass);
      _loginFetchar.sink.add(login);
    } catch (e) {
      print(e.toString());
    }
  }
  void komentar(BuildContext context, String komen, token) async{
    try{
      KomentarModel komentar = await repostory.komentar(context, komen, token);
      _komentarFetchar.sink.add(komentar);
    }catch (e){
      print(e.toString());
    }
  }

  void dispose() {
    _sampahFetchar.close();
    _produkFetchar.close();
    _loginFetchar.close();
    _komentarFetchar.close();
  }
}
