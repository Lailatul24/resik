import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:resik/model/EcomerceModel.dart';

class DetailTransaksi extends StatefulWidget {
  final data;
  DetailTransaksi({Key? key, this.data}) : super(key: key);

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  final con = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
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
                      size: 32,
                      color: Color(0xff85d0757),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Detail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    '5 Items',
                    style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text('20/03/2021',
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 17,
                          fontWeight: FontWeight.normal))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), child: Text('Data FOto'),
                    ),
                  ),
                  SizedBox(
                    width : 10,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sampah',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ), 
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Rp.20.000'),
                              Text('30 X')
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(8),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Jual'), Text('Rp 35.000')
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(8),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('fee'), Text('Rp 500')
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(8),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total :'), Text('34.500')
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff85d057),
                                onPrimary: Colors.white
                              ),
                              onPressed: () {
                                
                              },
                              child: Text('PROSES',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto"
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      )),
    );
  }
}
