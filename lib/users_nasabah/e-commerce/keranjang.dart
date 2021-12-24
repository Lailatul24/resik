import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/sukses_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Keranjang extends StatefulWidget {
  final String? id;
  final String? nama;
  final int? harga;
  const Keranjang({Key? key,this.id,this.nama,this.harga}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  final con = HomeController();
  dynamic username = 'Nasabah1';
  late List detailProduk ;
  @override
  void initState() {
   
    super.initState();
   
  }
  void _onBeli()async{
    List items = [];

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    var item = {
      'id_hargaProduk': widget.id,
      'jumlah': '1'
    };
    items.add(item);
    if (items.isNotEmpty){
    con.jualproduk(context, username, items, token);
    con.resBeli.listen((value) async{
      if(value.hasil == true){
        Fluttertoast.showToast(
              msg: 'berhasil',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Sukses(),
          ),
        );
        
      }else{
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff85d057),
        title: Text("Detail Pesanan"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [_produkBeli(), _pembayaran(), _pengiriman(), _total()],
            ),
          ),
        ),
      ),
    );
  }

  Padding _produkBeli() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Produk yang di Beli",
              style: TextStyle(color: Color(0xff909090)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.nama!, 
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        color: Color(0xff303030),
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Container(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Text("data")
                  ],
                ),
              )),
            )
          ],
        )));
  }

  Padding _pembayaran() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pembayaran", style: TextStyle(color: Color(0xff909090))),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pilih pembayaran",
                        style: TextStyle(color: Color(0xff909090)),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _pengiriman() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pengiriman", style: TextStyle(color: Color(0xff909090))),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [Text("Pilih Pengiriman")],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _total() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Order", style: TextStyle(
                    fontFamily:'NunitoSans',
                    fontSize: 15,
                  ),), Text("Rp.${widget.harga.toString()}", style: TextStyle(
                    fontFamily:'NunitoSans',
                    fontSize:15
                  ),)],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("fee", style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 15
                  ),), Text("Rp.500",style: TextStyle(
                    fontFamily:'NunitoSans',
                    fontSize:15
                  ))],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("total", style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 15,
                  ),), Text("Rp.${widget.harga!-500}",style: TextStyle(
                    fontFamily:'NunitoSans',
                    fontSize:15
                  ))],
                ),
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
                  onPressed: () => _onBeli(),
                  child: Text(
                    'check Out',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
