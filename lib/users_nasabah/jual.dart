import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/SampahModel.dart';

import 'package:resik/sukses_page.dart';

class JualSampah extends StatefulWidget {
  final String? idDesa;
  const JualSampah({Key? key, this.idDesa}) : super(key: key);

  @override
  _JualSampahState createState() => _JualSampahState();
}

int _n = 01;

class Img {
  String nama, images;
  Img({required this.nama, required this.images});
}

class _JualSampahState extends State<JualSampah> {
  final con = HomeController();

  String idDesa = '';
  String? gambar = '';
  String nama = '';
  String harga = '';

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  void initState() {
    super.initState();
    con.getSampahId(idDesa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
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
                          hintStyle: TextStyle(
                              fontSize: 15, color: Colors.grey[400]))),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      con.getSampahId(idDesa);
                    },
                    child: StreamBuilder<GetSampah>(
                        stream: con.resSampah.stream,
                        builder: (context, AsyncSnapshot<GetSampah> snapshot) {
                          print("data");
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (context, int i) {
                                  return Container(
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                              snapshot.data!.data![i].image!,
                                              height: 80,
                                              width: 80,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data!.data![i].namaSampah!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        width: 35,
                                                        height: 35,
                                                        child: TextButton(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Icon(
                                                                Icons.remove,
                                                                size: 20,
                                                                color: Color(
                                                                    0xff909090),
                                                              )),
                                                          onPressed: minus,
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xffE0E0E0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                        )),
                                                    Text("$_n"),
                                                    Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        width: 35,
                                                        height: 35,
                                                        child: TextButton(
                                                          child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 20,
                                                                color: Color(
                                                                    0xff909090),
                                                              )),
                                                          onPressed: add,
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xffE0E0E0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                        )),
                                                    Text(
                                                      "Rp. 100",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total"),
                          Text(
                            "Rp 50.xxx",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff85d057),
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sukses()));
                          },
                          child: Text(
                            'Jual Sampah',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto"),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
