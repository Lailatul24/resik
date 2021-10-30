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
                  radius: 39,
                  backgroundImage: AssetImage('assets/images/user.png'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 60,
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
                  onPressed: () {},
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
                                fontFamily: "Nunito Sans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Informasi Saldo dan Penarikan Saldo ',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "Nunito Sans"),
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
                  onPressed: () {},
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
                            'Ubah Pin',
                            style: TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "Nunito Sans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Mengubah Pin',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "Nunito Sans"),
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
                  onPressed: () {},
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
                                fontFamily: "Nunito Sans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Share Aplikasi ini',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "Nunito Sans"),
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
                  onPressed: () {},
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
                                fontFamily: "Nunito Sans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Keluar dari aplikasi',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 12,
                                fontFamily: "Nunito Sans"),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.login_rounded,
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
