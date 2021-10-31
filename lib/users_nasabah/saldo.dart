import 'package:flutter/material.dart';

class Saldo extends StatefulWidget {
  Saldo({Key? key}) : super(key: key);

  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
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
                    color: Color(0xff85d0757),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
