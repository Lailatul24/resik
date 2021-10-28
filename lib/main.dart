import 'package:flutter/material.dart';
import 'package:resik/intro.dart';
import 'package:resik/login.dart';
import 'package:resik/users_nasabah/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile(),
    );
  }
}
