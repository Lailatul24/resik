import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/ListsetorModel.dart';
import 'package:resik/prefs/prefrences.dart';
import 'package:resik/users_nasabah/detail_transaksi.dart';
import 'package:resik/users_nasabah/qrcode.dart';
import 'package:resik/users_nasabah/tes.dart';
import 'package:resik/users_nasabah/tes2.dart';

class Tes2 extends StatefulWidget {
  Tes2() : super();

  @override
  _Tes2State createState() => _Tes2State();
}

class _Tes2State extends State<Tes2> {
  final con = HomeController();

  String? token;
  List<Setoran> setor = [];
  List<Result> _listSetoran = <Result>[];
  List<Result> _listHari = <Result>[];

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
  // Future _byWeek(BuildContext context) async {
  //   _listHari.clear();

  //   _listHari.addAll(_listSetoran.where((element) {
  //     final date = element.createdAt;
  //     return now_1w.isBefore(date!);
  //   }));

  //   setState(() {});
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
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 300,
                  centerTitle: true,
                  title: Text('baba'),
                  bottom: AppBar(
                    title: Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term'),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
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
                          return Scrollbar(
                            thickness: 5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
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
                                                      kode: list.kode!)));
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
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(formatDate),
                                                    ],
                                                  ),
                                                ),
                                                Divider(),
                                                Text(
                                                    "Please help us to confirm  \nto get 10% discount code for next order."),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 96,
                                                        height: 36,
                                                        color:
                                                            Color(0xff85d057),
                                                        child: TextButton(
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "Qr Code",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child: Image.asset(
                                                                    'assets/images/qrscan.png'),
                                                              )
                                                            ],
                                                          ),
                                                          onPressed: () {
                                                            Navigator
                                                                .pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            Qrcode(
                                                                              data: list.kode!,
                                                                            )));
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Total Amount: Rp ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              list.status == "1"
                                                                  ? "Diproses"
                                                                  : list.status ==
                                                                          "2"
                                                                      ? "Sudah Di ambil"
                                                                      : "Gagal Di ambil",
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  color: Colors
                                                                          .red[
                                                                      600]),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            )),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 50,
          height: 30,
          color: color.withOpacity(0.5),
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}
