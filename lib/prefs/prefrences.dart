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
