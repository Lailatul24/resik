import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resik/users_nasabah/e-commerce/detail_produk.dart';
import 'package:resik/users_nasabah/saldo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 1;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<String> banner = [
    "assets/images/a.jpg",
    "assets/images/b.jpg",
    "assets/images/iconsayur.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xff85d057),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45))),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang Mr....",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "saldo Anda Rp...",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Roboto"),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Container(
                            child: Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                color: Color(0xffFCF2E1).withOpacity(0.5),
                                clipBehavior: Clip.antiAlias, // Add This
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            transitionDuration:
                                                Duration(seconds: 2),
                                            transitionsBuilder: (BuildContext
                                                    context,
                                                Animation<double> animation,
                                                Animation<double> secAnimation,
                                                Widget child) {
                                              animation = CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.elasticInOut);
                                              return ScaleTransition(
                                                alignment: Alignment.center,
                                                scale: animation,
                                                child: child,
                                              );
                                            },
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secAnimation) {
                                              return Saldo();
                                            }));
                                  },
                                  minWidth: 100,
                                  height: 45,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                            'assets/images/uanghome.png'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      new Text('Tarik Saldo',
                                          style: new TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment(1.1, 10),
                          child: Container(
                              height: 130,
                              width: 130,
                              child: Transform.translate(
                                offset: Offset(-5.0, 60.0),
                                child: Image.asset(
                                  'assets/images/pohon.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              )))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
                items: banner
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 0,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Center(
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: AnimatedSmoothIndicator(
                //*pakai animatesmoothindicator agar tanpa controller
                //!dan pakai _current dari carousel
                activeIndex: _current,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Color(0xffB7F5A1),
                  activeDotColor: Color(0xffA0E547),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Produk Unik",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Selengkapnya",
                      ))
                ],
              ),
            ),
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      child: Card(
                          color: Color(0xffE9FFE1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset("assets/images/a.jpg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text("Barang 1"),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                child: ElevatedButton(
                                  child: Text("Detail Produk"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProduk()));
                                  },
                                ),
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 200,
                      height: 150,
                      child: Card(
                          color: Color(0xffE9FFE1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset("assets/images/a.jpg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text("Barang 1"),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                  child: Text("Detail Produk"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProduk()));
                                  },
                                ),
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 200,
                      height: 160,
                      child: Card(
                          color: Color(0xffE9FFE1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset("assets/images/a.jpg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text("Barang 1"),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                  child: Text("Detail Produk"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProduk()));
                                  },
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
