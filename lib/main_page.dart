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
  int _selectIndex = 0;

  final _pageList = [
    Home(),
    JualSampah(),
    Profile(),
  ];

  onTappedItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: "Jual"),
          BottomNavigationBarItem(
              icon: Icon(Icons.horizontal_split_rounded), label: "Transaksi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Profile")
        ],
        currentIndex: _selectIndex,
        onTap: onTappedItem,
        selectedItemColor: Color(0xff85d057),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
