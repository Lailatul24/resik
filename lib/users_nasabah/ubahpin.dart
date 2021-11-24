import 'package:flutter/material.dart';
import 'package:resik/bloc/homeController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UbahPin extends StatefulWidget {
  const UbahPin({Key? key}) : super(key: key);

  @override
  _UbahPinState createState() => _UbahPinState();
}

class _UbahPinState extends State<UbahPin> {
  final con = HomeController();

  var _passBaru = TextEditingController();
  var _passLama = TextEditingController();
  var user = TextEditingController();

  bool inHiddenPass = true;
  bool _isHidden = true;

  ubahPass() async {
    String passBaru = _passBaru.text;
    String passLama = _passLama.text;
    String username = user.text;

    if (username == '' || passLama == '' || passBaru == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Harus Diisi !!')));
    } else {
      con.ubahPass(context, username, passBaru, passLama);
      _passLama.text = '';
      _passBaru.text = '';
      user.text = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff85d057),
        title: Text("UbahPassword"),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Password Lama",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: _passLama,
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
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Password Baru",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: _passBaru,
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
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff85d057),
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => ubahPass(),
                  child: Text(
                    'Kirim',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
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
