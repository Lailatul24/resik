import 'package:flutter/material.dart';

class UbahPin extends StatefulWidget {
  UbahPin({Key? key}) : super(key: key);

  @override
  _UbahPinState createState() => _UbahPinState();
}

class _UbahPinState extends State<UbahPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 50),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff303030),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Nunito Sans"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Ubah Pin Saya',
                  style: TextStyle(
                      color: Color(0xff909090),
                      fontSize: 13,
                      fontFamily: "DM Sans"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'PIN Code',
                  style: TextStyle(
                      color: Color(0xff303030),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "DM Sans"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(first: true, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: true),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: 49,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff85d057),
                            onPrimary: Color(0xffFFFFFF),
                            shape: StadiumBorder()),
                        onPressed: () {},
                        child: const Text('OK'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  Widget _textFieldOTP({bool? first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff303030)),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xff85d0757)),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
