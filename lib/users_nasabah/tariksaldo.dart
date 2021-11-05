import 'package:flutter/material.dart';
import 'dart:math' as math;  

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
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  Text('Tarik Saldo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text('Jumlah',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 17,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE5E5E5),
                                  hintText: "Jumlah Nominal",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ))
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff85d057),
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Tarik uang',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto"),
                                )),
                          ),
                      Transform.rotate(
                      angle: 335* math.pi/ 180,
                      child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(2.0,10),
                                        child: Container(
                                          height: 220,
                                          width: 220,
                                          child: Transform.translate(
                                            offset: Offset(-5.0, 60.0),
                                            child: Opacity(
                                              opacity: 0.3,
                                              child: Image.asset('assets/images/pohon.png',
                                              fit: BoxFit.fitHeight,
                                              ),
                                            )
                                        )
                                      ))
                                    ],
                                  ),
                    )
            
          ],
        ),
      )),
    );
  }
}
