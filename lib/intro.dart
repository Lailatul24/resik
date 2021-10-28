import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:resik/style/theme.dart' as Style;
import 'package:resik/home.dart';
import 'package:resik/login.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  _IntroPageState();
  bool clicked = false;
  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          SizedBox(
            height: 0.2,
          ),
          Text(
            'Peminjaman Barang',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 2,
          ),
        ],
      ),
      body: "Pinjam barang dengan efisien dan mempermudah",
      image: Center(
          child: SizedBox(
        height: 200,
        width: 350,
        child: Image(image: AssetImage('assets/images/intro1.png')),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(40)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          SizedBox(
            height: 0.2,
          ),
          Text(
            'Pilih Barang',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 2,
          ),
        ],
      ),
      body: "pilih barang yang anda inginkan",
      image: Center(
          child: SizedBox(
        height: 200,
        width: 350,
        child: Image(image: AssetImage('assets/images/intro2.png')),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
    PageViewModel(
      titleWidget: Column(
        children: <Widget>[
          SizedBox(
            height: 0.2,
          ),
          Text(
            'KONFIRMASI',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 2,
          ),
        ],
      ),
      body: "Segera Konfirmasi dan ambil barang",
      image: Center(
          child: SizedBox(
        height: 200,
        width: 350,
        child: Image(image: AssetImage('assets/images/intro3.png')),
      )),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descriptionPadding: EdgeInsets.only(left: 20, right: 20),
          imagePadding: EdgeInsets.all(20)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return clicked
        ? Home()
        : IntroductionScreen(
            pages: pages,
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Color(0xff85d057),
                color: Color(0xffb6f5a0),
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
            onDone: () {
              afterIntroComplete();
            },
            onSkip: () {
              afterIntroComplete();
            },
            showSkipButton: true,
            skip: const Text('Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            next: const Icon(Icons.navigate_next),
            nextColor: Color(0xff85d057),
            done: const Text("DONE",
                style: TextStyle(fontWeight: FontWeight.w600)),
          );
  }
}
