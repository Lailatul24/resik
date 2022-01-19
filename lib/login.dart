import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/main_page.dart';
import 'package:resik/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final con = HomeController();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final token = TextEditingController();

  bool validate = false;
  bool inHiddenPass = true;
  bool _isHidden = true;

  void login() async {
    String username = emailController.text;
    String pass = passController.text;

    SharedPreferences shared = await SharedPreferences.getInstance();
    if (emailController.text.isEmpty && passController.text.isEmpty) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wajib Disi')),
        );
      });
    } else {
      CircularProgressIndicator();
      con.login(context, username, pass);
      con.resLogin.listen((value) async {
        if (value.hasil == true) {
          await shared.setString('token', value.token!);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
          );
        } else {
          Fluttertoast.showToast(
              msg: 'Username dan password salah',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    }
  }

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('token');
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                height: 70,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 32,
                          color: Color(0xff85d057),
                        )),
                  ],
                )),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome Back to \nResik',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Silahkan masukkan data untuk login",
                    style: TextStyle(fontSize: 14.0, color: Color(0xff838589)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE5E5E5),
                                hintText: "Masukkan Email",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Input Username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passController,
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE5E5E5),
                                hintText: "Masukkan Password",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: InkWell(
                                  onTap: togglebutton,
                                  child: Icon(
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Input Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff85d057),
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () => login(),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto"),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Roboto"),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    primary: Color(0xff85d057),
                                    onSurface: Color(0xff85d057),
                                    side: BorderSide(
                                        color: Color(0xff85d057), width: 2),
                                  )))
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void togglebutton() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
