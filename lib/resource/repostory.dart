import 'package:flutter/cupertino.dart';

import 'package:resik/model/SampahModel.dart';
import 'package:resik/resource/api_provider.dart';

class Repostory {
  final api = ApiProvider();

  Future<GetSampah> getSampahId(String token) => api.getSampahId(token);

  Future login(BuildContext context, String username, String pass) =>
      api.login(context, username, pass);

  Future komentar(BuildContext context, String komen, token) =>
      api.komentar(context, komen, token);

  Future produk() => api.produk();

  Future ubahPass(
          BuildContext context, String passBaru, String passLama, token) =>
      api.ubahPass(context, passBaru, passLama, token);

  Future setor(BuildContext context, String username, List detailSetor,
          String token) =>
      api.setor(context, username, detailSetor, token);
  Future users(BuildContext context, token) => api.users(context, token);
  Future getEcomerce(BuildContext context) => api.getEcomerce(context);

  Future getBenner(BuildContext context) => api.getBenner(context);

  Future listSetor(String token) => api.listSetor(token);
}