import 'package:flutter/material.dart';
import 'package:resik/home.dart';

import 'package:resik/users_nasabah/jual.dart';
import 'package:resik/users_nasabah/profile.dart';

import 'package:resik/users_nasabah/transaksi.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_rounded), label: "Jual"),
    BottomNavigationBarItem(
        icon: Icon(Icons.horizontal_split_rounded), label: "Transaksi"),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded), label: "Profile")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [Home(), JualSampah(), Transaksi(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        selectedItemColor: Color(0xff85d057),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}



//Home(), JualSampah(), Transaksi(), Profile()