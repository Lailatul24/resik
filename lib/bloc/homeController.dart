import 'package:flutter/cupertino.dart';
import 'package:resik/model/BannerModel.dart';
import 'package:resik/model/EcomerceModel.dart';
import 'package:resik/model/ListsetorModel.dart';
import 'package:resik/model/LoginModel.dart';
import 'package:resik/model/Produk.dart';
import 'package:resik/model/KomentarModel.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/model/SetorModel.dart';
import 'package:resik/model/UbahPass.dart';
import 'package:resik/model/UsersModel.dart';
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
  final _usersFetchar = PublishSubject<UsersModel>();
  final _ecomerceFetchar = PublishSubject<GetEcomerce>();
  final _bannerFetchar = PublishSubject<GetBanner>();
  final _beliFetchar = PublishSubject<JualProduk>();
  final _listSetorFetchar = PublishSubject<ListsetorModel>();

  PublishSubject<GetSampah> get resSampah => _sampahFetchar;
  PublishSubject<Produk> get resProduk => _produkFetchar;
  PublishSubject<LoginModel> get resLogin => _loginFetchar;
  PublishSubject<KomentarModel> get resKomentar => _komentarFetchar;
  PublishSubject<UbahPassword> get resUbahPass => _ubahpassFetchar;
  PublishSubject<SetorSampah> get resSetor => _setorFetchar;
  PublishSubject<UsersModel> get resUsers => _usersFetchar;
  PublishSubject<GetEcomerce> get resEcomerce => _ecomerceFetchar;
  PublishSubject<GetBanner> get resBanner => _bannerFetchar;
  PublishSubject<ListsetorModel> get resListsetor => _listSetorFetchar;

  Future getSampahId(String token) async {
    try {
      GetSampah sampahModel = await repostory.getSampahId(token);
      _sampahFetchar.sink.add(sampahModel);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getEcomerce(BuildContext context) async {
    try {
      GetEcomerce ecomerce = await repostory.getEcomerce(context);
      _ecomerceFetchar.sink.add(ecomerce);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getBanner(BuildContext context) async {
    try {
      GetBanner banner = await repostory.getBenner(context);
      _bannerFetchar.sink.add(banner);
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

  void users(BuildContext context, token) async {
    try {
      UsersModel users = await repostory.users(context, token);
      _usersFetchar.sink.add(users);
    } catch (e) {
      print(e.toString());
    }
  }

  ubahPass(
      BuildContext context, String passBaru, String passLama, token) async {
    try {
      UbahPassword ubah =
          await repostory.ubahPass(context, passBaru, passLama, token);
      _ubahpassFetchar.sink.add(ubah);
    } catch (e) {
      print(e.toString());
    }
  }

  Future setor(BuildContext context, String username, List detailSetor,
      String token) async {
    try {
      SetorSampah setor =
          await repostory.setor(context, username, detailSetor, token);
      _setorFetchar.sink.add(setor);
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

  // Future jualproduk(
  //     BuildContext context, String username, List detailProduk, token) async {
  //   try {
  //     JualProduk beli =
  //         await repostory.jualproduk(context, username, detailProduk, token);
  //     _beliFetchar.sink.add(beli);
  Future getList(String token) async {
    try {
      ListsetorModel listSetor = await repostory.listSetor(token);
      _listSetorFetchar.sink.add(listSetor);
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
    _usersFetchar.close();
    _ecomerceFetchar.close();
    _bannerFetchar.close();
    _listSetorFetchar.close();
  }
}
