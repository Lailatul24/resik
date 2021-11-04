import 'package:flutter/material.dart';
import 'package:resik/home.dart';
import 'package:resik/users_nasabah/transaksi.dart';

class Sukses extends StatelessWidget {
  const Sukses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Succes!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Image(
                        image: AssetImage('assets/images/assetsresik.png'))),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Pembelian Barang anda akan segera kami proses",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                                builder: (context) => Transaksi()));
                      },
                      child: Text(
                        'Cek Transaksi',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          'Kembali ke Home',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          primary: Color(0xff85d057),
                          onSurface: Color(0xff85d057),
                          side: BorderSide(color: Color(0xff85d057), width: 2),
                        )))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
