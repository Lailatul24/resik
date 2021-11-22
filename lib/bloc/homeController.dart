import 'package:resik/model/Produk.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/resource/repostory.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final repostory = Repostory();

  final _sampahFetchar = PublishSubject<GetSampah>();
  final _produkFetchar = PublishSubject<Produk>();

  PublishSubject<GetSampah> get resSampah => _sampahFetchar;
  PublishSubject<Produk> get resProduk => _produkFetchar;

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

  void dispose() {
    _sampahFetchar.close();
    _produkFetchar.close();
  }
}
