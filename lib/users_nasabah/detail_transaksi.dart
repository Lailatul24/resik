import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/EcomerceModel.dart';

class DetailTransaksi extends StatefulWidget {
  DetailTransaksi({Key? key}) : super(key: key);

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  final con = HomeController();
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
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Detail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    '5 Items',
                    style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text('20/03/2021',
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 17,
                          fontWeight: FontWeight.normal))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
          ],
        ),
      )),
    );
  }
}
