import 'package:flutter/material.dart';
import 'package:resik/users_nasabah/tukarpulsa.dart';

class Saldo extends StatefulWidget {
  Saldo({Key? key}) : super(key: key);

  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            ),
            Container(
              width: 190,
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xff85D057),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(1.1, 1.5),
                    child: Container(
                      height: 170,
                      width: 150,
                      child: Transform.translate(
                        offset: Offset(-10.0, 30.0),
                        child: Image.asset(
                          'images/iconsayur.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Saldo Anda",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          r"Rp.2.000.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: SizedBox(
                    width: 160,
                    height: 60,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xffCDFDBD),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TukarPulsa()));
                      },
                      child: Row(
                        children: [
                          Text("Tukar Pulsa"),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset('images/iconarrowgreen.png',
                                  fit: BoxFit.fitHeight),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 50),
                  child: SizedBox(
                    width: 160,
                    height: 60,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xffFCF2E1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TukarPulsa()));
                      },
                      child: Row(
                        children: [
                          Text("Donasikan"),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset('images/iconarrowyelow.png',
                                  fit: BoxFit.fitHeight),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: SizedBox(
                          width: 160,
                          height: 60,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(23),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Color(0xffFCF2E1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TukarPulsa()));
                            },
                            child: Row(
                              children: [
                                Text("Tarik Saldo"),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        'images/iconarrowyelow.png',
                                        fit: BoxFit.fitHeight),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
