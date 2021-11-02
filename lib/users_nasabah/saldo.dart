import 'package:flutter/material.dart';
import 'package:resik/users_nasabah/tukarpulsa.dart';

class Saldo extends StatefulWidget {
  Saldo({Key? key}) : super(key: key);

  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              FittedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: SizedBox(
                      width: 150,
                      height: 54,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(23),
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
                        child: Row(
                          children: [
                            Text("Tukar Pulsa"),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: SizedBox(
                                height: 40,
                                width: 40,
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
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 50),
                    child: SizedBox(
                      width: 150,
                      height: 54,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(23),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Color(0xffFCF2E1),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TukarPulsa()));
                        },
                        child: Row(
                          children: [
                            Text("Donasikan"),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
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
                ],
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 200,
                    height: 65,
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
                                builder: (context) => TukarPulsa()));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Tarik Saldo",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
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
                      width: 180,
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
                                            'images/arrowupred.png'))
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
                                            'images/arrowdowngreen.png'))
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
                                            'images/arrowupred.png'))
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
