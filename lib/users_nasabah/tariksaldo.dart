import 'package:flutter/material.dart';

class TarikSaldo extends StatefulWidget {
  TarikSaldo({Key? key}) : super(key: key);

  @override
  _TarikSaldoState createState() => _TarikSaldoState();
}

class _TarikSaldoState extends State<TarikSaldo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      ))
                ],
              ),
            ),
            
          ],
        ),
      )),
    );
  }
}
