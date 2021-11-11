import 'package:flutter/material.dart';
import 'package:resik/users_nasabah/tukarpulsa.dart';
import 'package:resik/users_nasabah/tariksaldo.dart';
import 'package:resik/users_nasabah/donasi.dart';

class Saldo extends StatefulWidget {
  Saldo({Key? key}) : super(key: key);

  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 15) / 7;
    final double itemWidth = size.width / 2;

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
                    )
                  ],
                ),
              ),
              Container(
                width: 190,
                height: 200,
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff85D057),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(1.1, 1.5),
                      child: Container(
                        height: 170,
                        width: 150,
                        child: Transform.translate(
                          offset: Offset(-10.0, 30.0),
                          child: Image.asset(
                            'assets/images/iconsayur.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Saldo Anda",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            r"Rp.2.000.000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 500,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: [
                    Container(
                      height: 20,
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        height: 30,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Color(0xffCDFDBD),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TukarPulsa()));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Tukar Pulsa",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        'assets/images/iconarrowgreen.png',
                                        fit: BoxFit.fitHeight),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Color(0xffFCF2E1),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Donasi()));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Donasikan",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        'assets/images/iconarrowyelow.png',
                                        fit: BoxFit.fitHeight),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Color(0xffFCF2E1),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TarikSaldo()));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Tarik Saldo",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        'assets/images/iconarrowyelow.png',
                                        fit: BoxFit.fitHeight),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        width: 180,
                        height: 72,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xffCDFDBD),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset('assets/images/penjualan.png')),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Penjualan'),
                                Text('Rp.1.200.000')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      height: 72,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffFCF2E1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 20,
                              width: 20,
                              child:
                                  Image.asset('assets/images/tariksaldo.png')),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Tarik Saldo'),
                              Text('Rp.1.200.000')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Riwayat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Container(
                        width: 400,
                        height: 92,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 60,
                                width: 60,
                                child:
                                    Image.asset('assets/images/invoice.png')),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tarik Saldo',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text('Rp.200.000'),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text('WIB' + '-'),
                                    Text(
                                      '21.00',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: Image.asset(
                                            'assets/images/arrowupred.png'))
                                  ],
                                ),
                                Text('Sat, 6 jun 20'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        width: 400,
                        height: 92,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 60,
                                width: 60,
                                child:
                                    Image.asset('assets/images/invoice.png')),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tarik Saldo',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text('Rp.200.000'),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text('WIB' + '-'),
                                    Text(
                                      '21.00',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: Image.asset(
                                            'assets/images/arrowdowngreen.png'))
                                  ],
                                ),
                                Text('Sat, 6 jun 20')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        width: 400,
                        height: 92,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 60,
                                width: 60,
                                child:
                                    Image.asset('assets/images/invoice.png')),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tarik Saldo',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text('Rp.200.000'),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text('WIB' + '-'),
                                    Text(
                                      '21.00',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: Image.asset(
                                            'assets/images/arrowupred.png'))
                                  ],
                                ),
                                Text('Sat, 6 jun 20')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
