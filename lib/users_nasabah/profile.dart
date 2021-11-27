import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/intro.dart';
import 'package:resik/prefs/prefrences.dart';
import 'package:resik/register.dart';
import 'package:resik/users_nasabah/alertDialog.dart';
import 'package:resik/users_nasabah/saldo.dart';
import 'package:resik/users_nasabah/ubahpin.dart';
import 'package:resik/login.dart';
import 'package:resik/users_nasabah/kritiksaran.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class Img {
  String images;
  Img({required this.images});
}

List<Img> _gambar = [
  Img(images: "assets/images/profile.png"),
  Img(images: "assets/images/a.jpg"),
];

class _ProfileState extends State<Profile> {
  final con = HomeController();
  Future<void> komen() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      token == null ? KritikSaran() : alertDialog(context);
  }
  Future foto()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, AsyncSnapshot<SharedPreferences>pref) {
              var x = pref.data;
              if(x?.getString('token')== null){
                return FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    CircleAvatar(
                      radius: 39,
                      backgroundImage: AssetImage(_gambar[0].images),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: Color(0xff85d057),
                        minimumSize: Size(100, 40),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Register()));
                      },
                      child: Text('Daftar'),
                      style: OutlinedButton.styleFrom(
                        primary: Color(0xFF000000),
                        minimumSize: Size(100, 40),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              );
                
              }
              return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                CircleAvatar(
                  radius: 39,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sanburn',
                      style: TextStyle(
                          color: Color(0xff303030),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Nunito Sans"),
                    ),
                    Text(
                      'dimas@gmail.com',
                      style: TextStyle(
                          color: Color(0xff808080),
                          fontSize: 14,
                          fontFamily: "Nunito Sans"),
                    )
                  ],
                ),
              ],
            ),
          );
            }
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              SizedBox(
                width: 450,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () async{
                    SharedPreferences pref = await SharedPreferences.getInstance();
                       String? token = pref.getString('token');
                          token == null ? alertDialog(context) :  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Saldo()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo Saya',
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "NunitoSans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Informasi Saldo dan Penarikan Saldo ',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "NunitoSans"),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff909090),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 450,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () async{
                    SharedPreferences pref = await SharedPreferences.getInstance();
                       String? token = pref.getString('token');
                          token == null ? alertDialog(context) :  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UbahPin()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ubah Password',
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "NunitoSans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Mengubah Password',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "NunitoSans"),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff909090),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 450,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () async{
                    SharedPreferences pref = await SharedPreferences.getInstance();
                       String? token = pref.getString('token');
                          token == null ? alertDialog(context) :  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KritikSaran()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kritik & Saran',
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "NunitoSans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tempat Masukan Kritik dan Saran',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "NunitoSans"),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff909090),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 450,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () => alertDialog(context),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bagikan',
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "NunitoSans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Share Aplikasi ini',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "NunitoSans"),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.share,
                        color: Color(0xff909090),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 450,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Apa Anda yakin keluar"),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      removeToken();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  IntroPage()));
                                    },
                                    child: Text("Yes"),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"))
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "NunitoSans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Keluar dari aplikasi',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "NunitoSans"),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.login,
                        color: Color(0xff909090),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
