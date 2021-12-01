import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:resik/model/LoginModel.dart';
import 'package:resik/model/Produk.dart';
import 'package:resik/model/KomentarModel.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/model/SetorModel.dart';
import 'package:resik/model/UbahPass.dart';
import 'package:resik/resource/repostory.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final repostory = Repostory();

  final _sampahFetchar = PublishSubject<GetSampah>();
  final _produkFetchar = PublishSubject<Produk>();
  final _loginFetchar = PublishSubject<LoginModel>();
  final _komentarFetchar = PublishSubject<KomentarModel>();
  final _ubahpassFetchar = PublishSubject<UbahPassword>();
  final _setorFetchar = PublishSubject<SetorSampah>();

  PublishSubject<GetSampah> get resSampah => _sampahFetchar;
  PublishSubject<Produk> get resProduk => _produkFetchar;
  PublishSubject<LoginModel> get resLogin => _loginFetchar;
  PublishSubject<KomentarModel> get resKomentar => _komentarFetchar;
  PublishSubject<UbahPassword> get resUbahPass => _ubahpassFetchar;
  PublishSubject<SetorSampah> get resSetor => _setorFetchar;

  Future getSampahId(String token) async {
    try {
      GetSampah sampahModel = await repostory.getSampahId(token);
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

  void komentar(BuildContext context, String komen, token) async {
    try {
      KomentarModel komentar = await repostory.komentar(context, komen, token);
      _komentarFetchar.sink.add(komentar);
    } catch (e) {
      print(e.toString());
    }
  }

  ubahPass(BuildContext context, String token, String passBaru,
      String passLama) async {
    try {
      UbahPassword ubah =
          await repostory.ubahPass(context, token, passBaru, passLama);
      _ubahpassFetchar.sink.add(ubah);
    } catch (e) {
      print(e.toString());
    }
  }

  Future setor(BuildContext context, String banksampah, String username,
      List detailSetor, String token) async {
    try {
      SetorSampah setor = await repostory.setor(
          context, banksampah, username, detailSetor, token);
      _setorFetchar.sink.add(setor);
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    _sampahFetchar.close();
    _produkFetchar.close();
    _loginFetchar.close();
    _komentarFetchar.close();
    _ubahpassFetchar.close();
    _setorFetchar.close();
  }
}
