import 'package:flutter/material.dart';
import 'package:resik/sukses_page.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
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
                    Text("data"),
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
                  children: [Text("data"), Text("data")],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("data"), Text("data")],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("data"), Text("data")],
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sukses()));
                  },
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
