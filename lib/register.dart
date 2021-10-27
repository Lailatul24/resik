import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child:
                    Image(image: AssetImage('assets/images/maintanence.png')),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Oops !! Maaf Fitur Ini Masih Dalam Pengembangan",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff2E3851),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
