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

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = [
      PageViewModel(
        titleWidget: Column(
          children: <Widget>[
            SizedBox(
              height: 0.2,
            ),
            Text(
              'Aplikasi Resik hadir untuk menciptakan Solusi',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2,
            ),
          ],
        ),
        body: "Membantu pengambilan sampah dengan mudah dan efisien",
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
              'Pilih Sampah',
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
        body: "pilih sampah yang akan disetorkan",
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
              'Profit dari sampah',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 2,
            ),
          ],
        ),
        body: "Bisa menghasilkan uang dengan aplikasi resik",
        image: Center(
            child: SizedBox(
          height: 200,
          width: 350,
          child: Image(image: AssetImage('assets/images/intro3.png')),
        )),
        footer: SizedBox(
          width: 380,
          height: 49,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xff85d057),
                onPrimary: Colors.white,
                shape: StadiumBorder()),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text('Masuk Aplikasi!'),
          ),
        ),
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

    return clicked
        ? Login()
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
            showDoneButton: false,
            done: const Text("DONE",
                style: TextStyle(fontWeight: FontWeight.w600)),
            doneColor: Color(0xff85d057),
          );
  }
}
