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
                  padding: EdgeInsets.all(10),
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
                            }
                          } else {
                            return ListView.builder(
                                itemCount: detail.length,
                                itemBuilder: (_, index) {
                                  print(detail);
                                  var formatDate = DateFormat('dd/MM/YYY ')
                                      .format(snapshot
                                          .data!.message![index].createdAt!
                                          .toLocal());
                                  Setoran list = detail[index];
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list.jumlah!.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            formatDate,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                  "assets/images/a.jpg",
                                                  height: 100,
                                                  width: 100,
                                                )),
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
                                                  detail[index].sampah!,
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(list.jumlah
                                                          .toString()),
                                                      Text(
                                                        list.total.toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          }
                          return RefreshProgressIndicator();
                        }),
                  )),
              Column()
            ],
          ),
        ))));
  }
}
