import 'package:flutter/cupertino.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/resource/api_provider.dart';

class Repostory {
  final api = ApiProvider();

  Future<GetSampah> getSampahId(String idDesa) => api.getSampahId(idDesa);

  Future login(BuildContext context, String username, String pass) =>
      api.login(context, username, pass);

  Future produk() => api.produk();
}
