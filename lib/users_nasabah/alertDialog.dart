import 'package:flutter/material.dart';
import 'package:resik/login.dart';

void alertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Login Account"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.close))
                ],
              ),
              Divider()
            ],
          ),
          actions: [
            Align(
                alignment: Alignment.center,
                child: Image(image: AssetImage("assets/images/tangan.png"))),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                    "Silahkan login/ register telebih dahulu \n untuk melakukan transaksi"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Login")),
            )
          ],
        );
      });
}
