import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/user.png'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {},
                  child: Text('Daftar'),
                  style: OutlinedButton.styleFrom(
                    primary: Color(0xFF000000),
                    minimumSize: Size(100, 40),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 50.0,
                    horizontal: 20.0,
                  ),
                  width: 400,
                  height: 80,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 500,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 18,
                        left: 20,
                        child: Text(
                          'Saldo Saya',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1),
                              fontFamily: 'Nunito Sans',
                              fontSize: 18,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 48,
                        left: 20,
                        child: Text(
                          'Informasi saldo dan Penarikan Saldo',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontFamily: 'Nunito Sans',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.25),
                        )),
                  ])),
              Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 50.0,
                    horizontal: 20.0,
                  ),
                  width: 400,
                  height: 80,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 500,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))),
                    Positioned(
                        top: 18,
                        left: 20,
                        child: Text(
                          'Saldo Saya',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1),
                              fontFamily: 'Nunito Sans',
                              fontSize: 18,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                    Positioned(
                        top: 48,
                        left: 20,
                        child: Text(
                          'Informasi saldo dan Penarikan Saldo',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontFamily: 'Nunito Sans',
                              fontSize: 12,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.25),
                        )),
                  ]))
            ],
          )
        ],
      )),
    );
  }
}
