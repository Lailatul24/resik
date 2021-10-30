import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var press;
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
              TextButton(
        style: TextButton.styleFrom(
          
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: (){

        },
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(child: Text('Saldo Saya')),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
            ],
          )
        ],
      )),
    );
  }
}
