import 'package:flutter/material.dart';
import 'package:resik/home.dart';

class JualSampah extends StatefulWidget {
  const JualSampah({Key? key}) : super(key: key);

  @override
  _JualSampahState createState() => _JualSampahState();
}

class _JualSampahState extends State<JualSampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Jual Sampah',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffF0FFEB)),
              child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff85d057),
                      ),
                      hintText: "Search Sampah")),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                child: AspectRatio(
              aspectRatio: 3 / 1,
              child: Container(
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/maintanence.png'),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aqua",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 35,
            ),
          ]),
        ),
      ),
    );
  }
}
