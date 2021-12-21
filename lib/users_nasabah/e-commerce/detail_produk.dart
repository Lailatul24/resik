import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/users_nasabah/e-commerce/keranjang.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:resik/users_nasabah/alertDialog.dart';
class DetailProduk extends StatefulWidget {
  
  final String? nama;
  final int? harga; 
  final String? deskripsi;
  final String? id;
  const DetailProduk({Key? key,this.id,this.nama,this.harga,this.deskripsi}) : super(key: key);

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final con = HomeController();

  @override
  void initState() {
    
    super.initState();
    con.getEcomerce(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Produk",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child:
                          Image.asset('assets/images/a.jpg', fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           widget.nama!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.harga.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Deskripsi',
                                style: TextStyle(
                                  fontFamily:'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                                ),
                          )
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.deskripsi!, style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 14
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff85d057),
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                         SharedPreferences pref =
                        await SharedPreferences.getInstance();
                        String? token = pref.getString('token');
                        token == null
                            ? alertDialog(context)
                            : Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Keranjang(id : widget.id,
                                  nama : widget.nama,harga : widget.harga)));
                  },
                      child: Text(
                        'Pesan',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                      )),
                ),
              ),
            ),
          ]),
        ));
  }
}
