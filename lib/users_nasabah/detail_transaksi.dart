import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/ListsetorModel.dart';

class DetailTransaksi extends StatefulWidget {
  final kode;
  const DetailTransaksi({Key? key, this.kode}) : super(key: key);

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  final con = HomeController();
  List<Setoran> detail = [];
  List<Result> listsetor = [];
  String jumlah = '';
  String datetime = '';
  String nama = '';
  String tanggal = '';
  String total = '';

  @override
  void initState() {
    detailSetor();
    super.initState();
  }

  detailSetor() async {
    con.getList(widget.kode.toString());
    print(widget.kode);
    detail.map((e) {
      nama = e.sampah!;
    });
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
                  child: StreamBuilder<ListsetorModel>(
                      stream: con.resListsetor.stream,
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.result == null) {
                            return Text(" Data Kosong");
                          }
                        } else {
                          return ListView.builder(
                              itemCount: detail.length,
                              itemBuilder: (_, index) {
                                var formatDate = DateFormat('dd/MM/YYY ')
                                    .format(snapshot
                                        .data!.result![index].createdAt!
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
                                                nama,
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
                                                    Text(
                                                        list.jumlah.toString()),
                                                    Text(
                                                      list.total.toString(),
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
                                  ],
                                );
                              });
                        }
                        return RefreshProgressIndicator();
                      })),
              Column()
            ],
          ),
        ))));
  }
}
