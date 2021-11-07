import 'package:flutter/material.dart';
import 'dart:math' as math;

class KritikSaran extends StatefulWidget {
  KritikSaran({Key? key}) : super(key: key);

  @override
  _KritikSaranState createState() => _KritikSaranState();
}

class _KritikSaranState extends State<KritikSaran> {
  @override
  Widget build(BuildContext context) {
    final maxLines = 6;
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
                  Text(
                    'Kritik & Saran',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 82,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Saran anda akan membantu kami kedepannya',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: maxLines * 30.0,
              child: TextField(
                maxLines: maxLines,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffE5E5E5),
                    hintText: "Masukan Saran !!",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
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
                    'Kirim',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  )),
            ),
            Transform.rotate(
              angle: 335 * math.pi / 180,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment(2.0, 10),
                      child: Container(
                          height: 220,
                          width: 220,
                          child: Transform.translate(
                              offset: Offset(-5.0, 60.0),
                              child: Opacity(
                                opacity: 0.3,
                                child: Image.asset(
                                  'assets/images/pohon.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ))))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
