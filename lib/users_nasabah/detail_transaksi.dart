import 'package:flutter/material.dart';

class DetailTransaksi extends StatefulWidget {
  const DetailTransaksi({Key? key}) : super(key: key);

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
        backgroundColor: Color(0xff85d057),
      ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          children: [Text("data")],
        ),
      )),
    );
  }
}
