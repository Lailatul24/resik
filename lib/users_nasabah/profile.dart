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
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Row(
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
              width: 130,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                primary: Color(0xff85d057),
                minimumSize: Size(100, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
            ),
            SizedBox(
              width: 17,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Daftar'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(100, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
        Column(
          children: [],
        )
      ],
    ));
  }
}
