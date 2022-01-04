import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/DetailsetorModel.dart';
import 'package:resik/model/EcomerceModel.dart';

class DetailTransaksi extends StatefulWidget {
  final String kode;
  const DetailTransaksi({Key? key, required this.kode}) : super(key: key);

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  final con = HomeController();
  List<Setoran> detail = <Setoran>[];
  List<Setoran> setor = [];
  String? nama;

  @override
  void initState() {
    detailSetor();
    super.initState();
  }

  detailSetor() async {
    con.detailSetor(widget.kode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Detail Transaksi"),
          backgroundColor: Color(0xff85d057),
        ),
        body: SafeArea(
            child: Container(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 45,
                child: StreamBuilder<DetailsetorModel>(
                    stream: con.resDetailsetor.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.message == null) {
                          return Center();
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.message!.length,
                              itemBuilder: (_, i) {
                                var formatDate = DateFormat('dd/MM/yyyy')
                                    .format(snapshot
                                        .data!.message![i].createdAt!
                                        .toLocal());
                                return Container(
                                  height: 45,
                                  padding: EdgeInsets.only(
                                      left: 15, right: 30, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data!.message![i].namaNasabah!
                                            .fullname!,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        formatDate,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      con.detailSetor(widget.kode);
                    },
                    child: StreamBuilder<DetailsetorModel>(
                        stream: con.resDetailsetor.stream,
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.message == null) {
                              return Text(" Data Kosong");
                            } else {
                              return ListView.builder(
                                  itemCount: snapshot
                                      .data!.message!.first.setoran!.length,
                                  itemBuilder: (_, index) {
                                    // print(detail);

                                    Setoran list = snapshot
                                        .data!.message!.first.setoran![index];
                                    return Container(
                                      height: 140,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.asset(
                                                      "assets/images/a.jpg",
                                                      height: 80,
                                                      width: 80,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "list.sampah!",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "Rp : " +
                                                                list.harga
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                        Text(
                                                          list.jumlah
                                                                  .toString() +
                                                              "X",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          }
                          return RefreshProgressIndicator();
                        }),
                  )),
            ],
          ),
        ))));
  }
}
