import 'dart:async';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/SampahModel.dart';
import 'package:resik/prefs/prefrences.dart';
import 'package:resik/sukses_page.dart';
import 'package:resik/users_nasabah/alertDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JualSampah extends StatefulWidget {
  final String? token;
  const JualSampah({Key? key, this.token}) : super(key: key);

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

  String? token;
  String? banksampah = "jLReOov";
  String? username = 'Nasabah1';
  List<Result> _listSampah = <Result>[];
  List<Result> _listSearch = <Result>[];
  List<CartSampah> _listCart = [];
  final formatter = NumberFormat('#,##0', 'id_ID');
  Color setor = Colors.grey;
  var _controller = TextEditingController();
  Timer? debounce;
  String search = '';

  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  // void _onRefresh() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   _listSampah.clear();

  //   _refreshController.refreshCompleted();
  // }

  // void _onLoading() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   _listSampah.clear();

  //   _refreshController.loadComplete();
  // }

  // getPref() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? token = pref.getString('token');
  //   // print(token);
  //   if (token != null) {
  //     con.getSampahId(token);
  //   } else {
  //     alertDialog(context);
  //   }
  // }

  @override
  void initState() {
    getToken().then((value) {
      if (value != null) {
        con.getSampahId(value);
        setState(() {
          token = value;
          print(token);
        });
      } else {
        alertDialog(context);
      }
    });
    con.resSampah.listen((value) {
      _listSampah.addAll(value.result!);
      value.result!.forEach((e) {
        _listCart.add(CartSampah(
          kode: e.kode,
          qty: 0,
          nama: e.nama,
          harga: e.hargaSetor,
          jumlah: 0,
        ));
      });
      setState(() {});
      super.initState();
    });
  }

  void _onJual() {
    List items = [];

    _listCart.forEach((e) {
      if (e.qty! > 1) {
        var item = {
          'kode': e.kode,
          'jumlah': e.qty,
        };
        items.add(item);
      } 
    });

    con.setor(context, banksampah!, username!, items, token!);
    con.resSetor.listen((value) {
      if (value.hasil == true) {
        Fluttertoast.showToast(
            msg: "Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Sukses()));
      } else {
        Fluttertoast.showToast(
            msg: "Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _listSampah.clear();
    _listSearch.clear();
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
                  controller: _controller,
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
                    _onSearch(value);
                  },
                )),
            SizedBox(height: 15),
            Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<GetSampah>(
                    stream: con.resSampah,
                    builder: (context, snap) {
                      if (snap.hasData) {
                        var result = snap.data!.result;
                        if (result!.isEmpty) {
                          return Center(
                            child: Text('NO Foking Data'),
                          );
                        } else {
                          if (_listSearch.isNotEmpty) {
                            return ListView(
                              padding: EdgeInsets.only(bottom: 50),
                              children: _listSearch
                                  .map((e) => _cardSampah(e))
                                  .toList(),
                            );
                          }
                          return ListView(
                            padding: EdgeInsets.only(bottom: 380),
                            children:
                                result.map((e) => _cardSampah(e)).toList(),
                          );
                        }
                      } else {
                        return Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 400),
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
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
                        child: ListView(
                          padding: EdgeInsets.only(top: 0, bottom: 68),
                          children: _listCart.map((e) {
                            if (e.qty! <= 0) {
                              return Container();
                            } else {
                              return _itemCart(e);
                            }
                          }).toList(),
                        ),
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
            color: Colors.white,
            child: ListView.builder(
                itemCount: _listSampah.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(8),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Total"), _cartJumlah()],
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
                            onPressed: () => _onJual(),
                            child: Text(
                              'Jual Sampah',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto"),
                            )),
                      ),
                    ],
                  );
                })),
      ),
    ])));
  }
  // void searchOperation(value){
  //   _listSearch.clear();
  //   if(
  //     _listSearch != null {
  //       for (int i = 0; i < _listSampah.length; i++){
  //         String data = _listSampah[index];
  //         if (data)
  //       }
  //     }
  //   )
  // }

  // void _onSearch(String value) {
  //   _listSearch.clear();
  //   if (value.isEmpty) {
  //     setState(() {});
  //     return;
  //   }

  //   _listSearch.forEach((element) {
  //     if (element.nama!.toLowerCase().contains(value.toLowerCase()))
  //       _listSearch.add(element);
  //   });

  //   setState(() {});
  // }
  Widget _cartJumlah() {
    int total = 0;
    _listCart.forEach((e) {
      total += e.qty! * e.harga!;
    });
    return Text(
      'Rp. ${formatter.format(total)}',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container _cardSampah(Result res) {
    var cart = _listCart.firstWhere((e) => e.kode == res.kode);
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), child: Text("data")),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  res.nama!,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 35,
                        height: 35,
                        child: TextButton(
                          child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                size: 20,
                                color: Color(0xff909090),
                              )),
                          onPressed: () {
                            if (cart.qty != 0) {
                              cart.qty = cart.qty! - 1;
                              setState(() {});
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xffE0E0E0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Text('${cart.qty}'),
                      Container(
                          margin: EdgeInsets.all(10),
                          width: 35,
                          height: 35,
                          child: TextButton(
                            child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Color(0xff909090),
                                )),
                            onPressed: () {
                              cart.qty = cart.qty! + 1;
                              setState(() {});
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xffE0E0E0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                      Text(
                        'Rp. ${formatter.format(res.hargaSetor!)}'.toString(),
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
    );
  }

  Widget _itemCart(CartSampah e) {
    var jumlah = e.qty! * e.harga!;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(
        left: 2,
        right: 2,
      ),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 1.0),
          ),
          color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 110,
            height: 30,
            child: Text(
              "${e.nama}",
              style: TextStyle(fontFamily: "Open Sans"),
            ),
          ),
          Container(
            height: 30,
            child: Text(
              "${e.qty}",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Open Sans"),
            ),
          ),
          Container(
            height: 30,
            child: Text(
              "Rp. ${formatter.format(e.harga)}",
              textAlign: TextAlign.right,
              style: TextStyle(fontFamily: "Open Sans"),
            ),
          ),
          Container(
            height: 30,
            child: Text(
              "Rp. ${formatter.format(jumlah)}",
              textAlign: TextAlign.right,
              style: TextStyle(fontFamily: "Open Sans"),
            ),
          ),
        ],
      ),
    );
  }

  _onSearch(String search) {
    _listSearch.clear();
    if (search.isNotEmpty) {
      _listSearch.addAll(
        _listSampah.where(
          (e) => e.nama!.toLowerCase().contains(search.toLowerCase()),
        ),
      );
    }
    setState(() {});
  }
}

class CartSampah {
  CartSampah({
    this.jumlah,
    this.kode,
    this.harga,
    this.nama,
    this.qty,
  });

  int? jumlah;
  int? qty;
  int? harga;
  String? kode;
  String? nama;
}