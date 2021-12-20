import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.setString("token", value);
}

Future getToken() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.getString("token");
}

Future removeToken() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("token");
}

Future setKode(String value) async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.setString('kode', value);
}

Future getKode() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.getString('kode');
}

Future setAnggota(String value) async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.setString('username', value);
}

Future getAnggota() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.getString('username');
}
