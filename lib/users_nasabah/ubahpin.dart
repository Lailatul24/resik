import 'package:flutter/material.dart';

class UbahPin extends StatefulWidget {
  const UbahPin({Key? key}) : super(key: key);

  @override
  _UbahPinState createState() => _UbahPinState();
}

class _UbahPinState extends State<UbahPin> {
  bool inHiddenPass = true;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UbahPassword"),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Password Lama"),
            TextField(
              obscureText: _isHidden,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE5E5E5),
                  hintText: "Masukkan Password Lama",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: togglebutton,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Password Baru"),
            TextField(
              obscureText: _isHidden,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE5E5E5),
                  hintText: "Masukkan Password Baru",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: togglebutton,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }

  void togglebutton() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
