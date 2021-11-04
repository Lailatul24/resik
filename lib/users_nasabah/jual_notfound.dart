import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resik/home.dart';

class JualNotFound extends StatefulWidget {
  const JualNotFound({Key? key}) : super(key: key);

  @override
  _JualNotFoundState createState() => _JualNotFoundState();
}

class Img {
  String nama, images;
  Img({required this.nama, required this.images});
}

class _JualNotFoundState extends State<JualNotFound> {
  List<Img> _gambar = [
    Img(images: "assets/images/a.jpg", nama: "barang 1"),
    Img(images: "assets/images/a.jpg", nama: "barang 1")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListView(children: [
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
                          size: 25,
                          color: Color(0xff85d057),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Jual Sampah",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xffF0FFEB)),
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff85d057),
                        ),
                        hintText: "Search Sampah",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.grey[400]))),
              ),
              Spacer(),]),
          ),
        ),
      ),
    );
  }
}
