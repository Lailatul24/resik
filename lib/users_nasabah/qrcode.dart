import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:resik/main_page.dart';
import 'package:resik/transaksi.dart';

class Qrcode extends StatefulWidget {
  final String data;
  Qrcode({Key? key, required this.data}) : super(key: key);

  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
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
                        size: 27,
                        color: Color(0xff85d0757),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'QrCode',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                height: 300,
                width: 200,
                alignment: Alignment.center,
                child: QrImage(
                    version: QrVersions.auto,
                    backgroundColor: Color(0xFFC5C5C5),
                    foregroundColor: Color(0xff000000),
                    data: widget.data),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(3),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali keDepan',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Color(0xff303030)),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xffffffff),
                    primary: Color(0xff85d057),
                    onSurface: Color(0xff000000),
                    side: BorderSide(color: Color(0xff85d057), width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
