import 'package:flutter/material.dart';

class ProfileLogin extends StatefulWidget {
  const ProfileLogin({Key? key}) : super(key: key);

  @override
  _ProfileLoginState createState() => _ProfileLoginState();
}

class _ProfileLoginState extends State<ProfileLogin> {
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
