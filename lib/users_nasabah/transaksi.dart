import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/ListsetorModel.dart';
import 'package:resik/prefs/prefrences.dart';
import 'package:resik/users_nasabah/detail_transaksi.dart';
import 'package:resik/users_nasabah/qrcode.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  final con = HomeController();
  String? token;
  List<Setoran> setor = [];
  List<Result> _listSetoran = <Result>[];

  // _sendKode() {
  //   List items = [];

  //   setor.forEach((e) {
  //     if (e.kode != null) {
  //       var item = {'setor': e.kode};
  //       print(item);
  //       items.add(item);
  //     }
  //   });
  //   con.detailsetor(context, items.toString());
  //   print(items);
  // }

  @override
  void initState() {
    getToken().then((value) {
      con.getList(value);
      setState(() {
        token = value;
        print(token);
      });
    });
    // con.resListsetor.listen((value) {
    //   _listSetoran.addAll(value.result!);
    //   value.result!.forEach((e) {
    //     setor.add(Setoran(kode: e.kode!));
    //   });

    // });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ListView(children: [
            Container(
                padding: EdgeInsets.only(right: 10, left: 10),
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
                      width: 50,
                    ),
                    Text("Transaksi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(bottom: 150),
              height: MediaQuery.of(context).size.height,
              child: RefreshIndicator(
                onRefresh: () async {
                  con.getList(token!);
                },
                child: StreamBuilder<ListsetorModel>(
                    stream: con.resListsetor.stream,
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.result == null) {
                          return Center(
                            child: Text('Data kosong '),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.result!.length,
                              itemBuilder: (context, index) {
                                var formatDate = DateFormat('yyyy-MM-dd ')
                                    .format(snapshot
                                        .data!.result![index].createdAt!
                                        .toLocal());
                                Result list = snapshot.data!.result![index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailTransaksi(
                                                  kode: list.kode,
                                                )));
                                  },
                                  child: Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Order ${list.kode}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(formatDate),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ),
          ])),
    ));
  }
}
