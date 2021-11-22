import 'package:flutter/material.dart';

class DetailTransaksi extends StatefulWidget {
  const DetailTransaksi({Key? key}) : super(key: key);

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
        backgroundColor: Color(0xff85d057),
      ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 25,
          right: 25,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        color: Colors.black,
                        child: Image(
                          image: AssetImage('assets/images/qrscan.png'),
                          height: 35,
                          width: 35,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jual Sampah",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text("2020/11/11")
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xff85d057),
                  ),
                  child: Text(
                    "diproses",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
            Divider(
              height: 15,
              color: Colors.black26,
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("List Sampah"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: ClipRRect(
                              child: Image(
                            image: AssetImage('assets/images/b.jpg'),
                            height: 50,
                            width: 50,
                          )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("data")
                      ],
                    ),
                    Text(
                      "Rp. 5000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: ClipRRect(
                              child: Image(
                            image: AssetImage('assets/images/b.jpg'),
                            height: 50,
                            width: 50,
                          )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("data")
                      ],
                    ),
                    Text(
                      "Rp. 5000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: ClipRRect(
                              child: Image(
                            image: AssetImage('assets/images/b.jpg'),
                            height: 50,
                            width: 50,
                          )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("data")
                      ],
                    ),
                    Text(
                      "Rp. 5000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  height: 15,
                  color: Colors.black54,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total penjualan"),
                    Text(
                      "Rp. 15000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
