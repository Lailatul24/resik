import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resik/home.dart';

class JualSampah extends StatefulWidget {
  const JualSampah({Key? key}) : super(key: key);

  @override
  _JualSampahState createState() => _JualSampahState();
}

class _JualSampahState extends State<JualSampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
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
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/a.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Barang 1",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                              ),
                              Text("01"),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.minimize_outlined),
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Rp. 100",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ]),
        ),
      ),
    );
  }
}
