import 'package:flutter/material.dart';
import 'package:resik/users_nasabah/alertDialog.dart';

class TukarPulsa extends StatefulWidget {
  TukarPulsa({Key? key}) : super(key: key);

  @override
  _TukarPulsaState createState() => _TukarPulsaState();
}

class _TukarPulsaState extends State<TukarPulsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tukar Pulsa"),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Card(
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text("Saldo Anda"),
                    subtitle: Text("2000"),
                  ),
                ),
                onTap: () => alertDialog(context),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Masukkan Nomor Hp",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              child: TextFormField(
                  decoration: InputDecoration(
                hoverColor: Color(0xffA0E547),
                suffixIcon: Icon(Icons.perm_contact_calendar_outlined),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  Container(
                    child: Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.green[400],
                      child: ListTile(
                        title: Text("Pulsa 5 Rb"),
                        subtitle: Text("Rp 7000"),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.green,
                      child: ListTile(
                        title: Text("Pulsa 5 Rb"),
                        subtitle: Text("Rp 7000"),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.green,
                      child: ListTile(
                        title: Text("Pulsa 5 Rb"),
                        subtitle: Text("Rp 7000"),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.green,
                      child: ListTile(
                        title: Text("Pulsa 5 Rb"),
                        subtitle: Text("Rp 7000"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
