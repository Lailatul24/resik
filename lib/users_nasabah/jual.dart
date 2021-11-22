import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qr_flutter/qr_flutter.dart';
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

  String idSampah = '';
  String idDesa = '';
  String? gambar = '';
  String nama = '';
  String harga = '';
  List qtyList = [];
  List totalHarga = [];
  List postDetail = [];
  List hargaSetor = [];
  List namaSampah = [];
  List<Datum> _listSampah = <Datum>[];
  List<Datum> _listSearch = <Datum>[];

  var _controller = TextEditingController();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _listSampah.clear();
    con.getSampahId("DSA05");
<<<<<<< HEAD

=======
>>>>>>> 6fdf15e3279c80236729c0308a729a6e7dd0faae
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _listSampah.clear();
    con.getSampahId("DSA05");

    _refreshController.loadComplete();
  }

  Color setor = Colors.grey;

  @override
  void initState() {
    super.initState();
    con.getSampahId("DSA05");
    //! menggunakan qtyList
    con.resSampah.listen((value) {
      for (var i = 0; i < value.data!.length; i++) {
        qtyList.add(0);
        totalHarga.add(0);
        postDetail.add(0);
        namaSampah.add(0);
        hargaSetor.add(0);
      }

      if (mounted)
        setState(() {
          if (_listSampah.isNotEmpty) {
            if (mounted)
              setState(() {
                _listSampah.clear();
              });
          } else {
            _listSampah.addAll(value.data!);
            _listSearch = _listSampah;
          }
        });
    });
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
                    hintStyle:
                        TextStyle(fontSize: 15, color: Colors.grey[400])),
                onChanged: (value) {
                  setState(() {
                    _listSearch = _listSampah.where((element) {
                      var namaSampah = element.namaSampah!.toLowerCase();
                      return namaSampah.contains(value.toLowerCase());
                    }).toList();
                  });
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
                height: MediaQuery.of(context).size.height,
                child: _listSearch == null
<<<<<<< HEAD
                    ? Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 8),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, _) => Padding(
                            padding: const EdgeInsets.only(left: 12.0),
=======
                    ? ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _listSearch.length,
                        itemBuilder: (context, index) {
                          if (qtyList[index] != 0) {
                            postDetail[index] = {
                              "id_sampah": _listSampah[index].idSampah!,
                              "Jumlah": qtyList[index],
                              "harga": _listSampah[index].hargaSetor
                            };
                            namaSampah[index] = _listSampah[index].namaSampah;
                            hargaSetor[index] = _listSampah[index].hargaSetor;
                          } else {
                            postDetail[index] = 0;
                            namaSampah[index] = 0;
                            hargaSetor[index] = 0;
                          }
                          Datum sampah = _listSampah[index];
                          return Container(
>>>>>>> 6fdf15e3279c80236729c0308a729a6e7dd0faae
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 8, top: 8, left: 8),
                                      height: 10,
                                      width: 150,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 8, left: 8),
                                      height: 10,
                                      width: 200,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      height: 10,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          itemCount: 3,
                        ),
                      )
                    : SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: false,
                        header: WaterDropMaterialHeader(),
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        child: Container(
                          height: 400,
                          child: _listSearch.isEmpty
                              ? Center(
                                  child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/maintanence.png",
                                      scale: 3,
                                    ),
                                    Text("Data Sampah tidak ditemukan"),
                                  ],
                                ))
                              : ListView.builder(
<<<<<<< HEAD
                                  physics: NeverScrollableScrollPhysics(),
=======
                                physics: ScrollPhysics(),
>>>>>>> 6fdf15e3279c80236729c0308a729a6e7dd0faae
                                  shrinkWrap: true,
                                  itemCount: _listSearch.length,
                                  itemBuilder: (context, index) {
                                    if (qtyList[index] != 0) {
                                      postDetail[index] = {
                                        "id_sampah":
                                            _listSampah[index].idSampah!,
                                        "Jumlah": qtyList[index],
                                        "harga": _listSampah[index].hargaSetor
                                      };
                                      namaSampah[index] =
                                          _listSampah[index].namaSampah;
                                      hargaSetor[index] =
                                          _listSampah[index].hargaSetor;
                                    } else {
                                      postDetail[index] = 0;
                                      namaSampah[index] = 0;
                                      hargaSetor[index] = 0;
                                    }
                                    Datum sampah = _listSampah[index];
                                    return Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                sampah.image!,
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
                                                  sampah.namaSampah!,
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
                                                    children: <Widget>[
                                                      qtyList[index] != 0
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              width: 35,
                                                              height: 35,
                                                              child: TextButton(
                                                                child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 20,
                                                                      color: Color(
                                                                          0xff909090),
                                                                    )),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    qtyList[index] =
                                                                        qtyList[index] -
                                                                            1;
                                                                    totalHarga[
                                                                        index] = int.parse(_listSampah[index]
                                                                            .hargaSetor!) *
                                                                        qtyList[
                                                                            index];
                                                                    if (totalHarga.reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b) ==
                                                                        0) {
                                                                      setor = Colors
                                                                          .grey;
                                                                    } else {
                                                                      setor = Colors
                                                                          .green;
                                                                    }
                                                                  });
                                                                },
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xffE0E0E0),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10))),
                                                              ),
                                                            )
                                                          : Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              width: 35,
                                                              height: 35,
                                                              child: TextButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  size: 20,
                                                                  color: Color(
                                                                      0xff909090),
                                                                ),
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xffE0E0E0),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10))),
                                                              ),
                                                            ),
                                                      Text(qtyList[index]
                                                          .toString()),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
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
                                                            onPressed: () {
                                                              setState(() {
                                                                qtyList[index] =
                                                                    qtyList[index] +
                                                                        1;
                                                                totalHarga[
                                                                    index] = int.parse(
                                                                        _listSampah[index]
                                                                            .hargaSetor!) *
                                                                    qtyList[
                                                                        index];
                                                                if (totalHarga.reduce(
                                                                        (a, b) =>
                                                                            a +
                                                                            b) ==
                                                                    0) {
                                                                  setor = Colors
                                                                      .grey;
                                                                } else {
                                                                  setor = Colors
                                                                      .green;
                                                                }
                                                              });
                                                            },
                                                            style: TextButton.styleFrom(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xffE0E0E0),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                          )),
                                                      Text(
                                                        "Rp : " +
                                                            sampah.hargaJual!,
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
                                    );
                                  }),
                        ),
                      )),
          ]),
        ),
      ),
      DraggableScrollableSheet(
          initialChildSize: 0.23,
          minChildSize: 0.23,
          maxChildSize: 0.57,
          builder: (BuildContext c, s) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    )
                  ]),
              child: ListView(
                controller: s,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 8,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(child: Text('Detail Swipe Up')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Detail Setor",
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                'Nama Sampah',
                                style: TextStyle(fontFamily: "Open Sans"),
                              ),
                            ),
                          ),
                          Container(
                              child: Center(
                            child: Text(
                              'Jumlah',
                              style: TextStyle(fontFamily: "Open Sans"),
                            ),
                          )),
                          Container(
                            child: Center(
                              child: Text(
                                'harga',
                                style: TextStyle(fontFamily: "Open Sans"),
                              ),
                            ),
                          ),
                          Container(
                              child: Center(
                            child: Text(
                              'total',
                              style: TextStyle(fontFamily: "Open Sans"),
                            ),
                          ))
                        ],
                      ),
                      Container(
                        height: 250,
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 0),
                            itemCount: namaSampah.length,
                            itemBuilder: (context, index) {
                              return namaSampah[index] != 0
                                  ? Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.only(
                                        left: 2,
                                        right: 2,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          color: Colors.grey),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: 110,
                                            height: 30,
                                            child: Text(
                                              "${namaSampah[index]}",
                                              style: TextStyle(
                                                  fontFamily: "Open Sans"),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            child: Text(
                                              "${qtyList[index]}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Open Sans"),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            child: Text(
                                              "${hargaSetor[index]}",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontFamily: "Open Sans"),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            child: Text(
                                              "Rp. ${totalHarga[index]}",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontFamily: "Open Sans"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ListView(
            children: [
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(8),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total"),
                    Text(
                      "Rp 50.xxx",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff85d057),
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sukses()));
                  },
                  child: Text(
                    'Jual Sampah',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  )),
            ],
          ),
        ),
      ),
    ])));
  }
}
