import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resik/model/BannerModel.dart';
import 'package:resik/model/EcomerceModel.dart';
import 'package:resik/model/UsersModel.dart';
import 'package:resik/users_nasabah/e-commerce/detail_produk.dart';
import 'package:resik/users_nasabah/saldo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:resik/prefs/prefrences.dart';
import 'package:resik/users_nasabah/alertDialog.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  final String? token;
  const Home({Key? key, this.token}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? token;
  String? idBarang;
  // String? nama;
  // String? deskripsi;
  // String? foto;
  // String? harga;
  final con = HomeController();
  int _current = 1;
  // List<Result> banner = <Result>[];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }

  @override
  void initState() {
    getToken().then((value) {
      con.users(context, value);
      setState(() {
        token = value;
      });
    });
    super.initState();
    con.getEcomerce(context);
    con.getBanner(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Container(
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
                          Container(
                            child: FutureBuilder(
                                future: getToken(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Selamat Datang Mr....",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto"),
                                        ),
                                        Text(
                                          "saldo Anda Rp...",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontFamily: "Roboto"),
                                        ),
                                      ],
                                    );
                                  }
                                  return StreamBuilder<UsersModel>(
                                      stream: con.resUsers.stream,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data!.result == null) {
                                            return Center(
                                              child: Text('Data Kosong'),
                                            );
                                          } else {
                                            var result = snapshot.data!.result;
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Selamat Datang Mr${result!.fullname}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Roboto"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "saldo Anda Rp ${result.saldo}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontFamily: "Roboto"),
                                                ),
                                              ],
                                            );
                                          }
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      });
                                }),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Container(
                              child: Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  color:
                                      const Color(0xffFCF2E1).withOpacity(0.5),
                                  clipBehavior: Clip.antiAlias, // Add This
                                  child: MaterialButton(
                                    onPressed: () async {
                                      SharedPreferences pref =
                                          await SharedPreferences.getInstance();
                                      String? token = pref.getString('token');
                                      token == null
                                          ? alertDialog(context)
                                          : Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration:
                                                      Duration(seconds: 2),
                                                  transitionsBuilder:
                                                      (BuildContext context,
                                                          Animation<double>
                                                              animation,
                                                          Animation<double>
                                                              secAnimation,
                                                          Widget child) {
                                                    animation = CurvedAnimation(
                                                        parent: animation,
                                                        curve: Curves
                                                            .elasticInOut);
                                                    return ScaleTransition(
                                                      alignment:
                                                          Alignment.center,
                                                      scale: animation,
                                                      child: child,
                                                    );
                                                  },
                                                  pageBuilder:
                                                      (BuildContext context,
                                                          Animation<double>
                                                              animation,
                                                          Animation<double>
                                                              secAnimation) {
                                                    return Saldo();
                                                  }));
                                    },
                                    minWidth: 100,
                                    height: 45,
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
                                  offset: Offset(-5.0, 70.0),
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
                child: StreamBuilder<GetBanner>(
                    stream: con.resBanner.stream,
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.result == null) {
                          return Center(
                            child: Text('Data kosong '),
                          );
                        } else {
                          return CarouselSlider.builder(
                            itemCount: snapshot.data!.result!.length,
                            itemBuilder: (context, i, id) {
                              ResultB banner = snapshot.data!.result![i];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 0,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Center(
                                      child: Image.network(
                                        banner.foto!,
                                        fit: BoxFit.cover,
                                        width: double.maxFinite,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 2),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 500),
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
                          );
                        }
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
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
                      dotWidth: 10,
                      dotHeight: 10),
                ),
              ),
              SizedBox(
                height: 20,
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
                  width: 200,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: StreamBuilder<GetEcomerce>(
                        stream: con.resEcomerce.stream,
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.result == null) {
                              return Center(
                                child: Text('Data kosong '),
                              );
                            } else {
                              return ListView.builder(
                                  itemCount: snapshot.data!.result!.length,
                                  itemBuilder: (context, index) {
                                    var result = snapshot.data!.result![index];
                                    return Container(
                                      width: 200,
                                      height: 200,
                                      child: Card(
                                          color: Color(0xffE9FFE1),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image(
                                                      image: AssetImage(
                                                          'assets/images/b.jpg'),
                                                      fit: BoxFit.cover)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 8),
                                                child:
                                                    Text(result.produk!.nama!),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: ElevatedButton(
                                                  child: Text("Detail Produk"),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailProduk(
                                                                    id:
                                                                        result
                                                                            .id,
                                                                    nama: result
                                                                        .produk!
                                                                        .nama,
                                                                    harga: result
                                                                        .hargaJual,
                                                                    deskripsi: result
                                                                        .produk!
                                                                        .deskripsi)));
                                                  },
                                                ),
                                              )
                                            ],
                                          )),
                                    );
                                  });
                            }
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
