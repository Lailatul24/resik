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

  Future ubahPass(BuildContext context, String username, String token,
          String passBaru, String passLama) =>
      api.ubahPass(context, token, username, passBaru, passLama);
}
