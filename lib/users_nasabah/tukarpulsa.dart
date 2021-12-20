import 'package:flutter/material.dart';
import 'package:resik/users_nasabah/alertDialog.dart';
import 'package:resik/model/PulsaModel.dart';
import 'package:resik/users_nasabah/utils_pulsa/operationcard.dart';

class TukarPulsa extends StatefulWidget {
  TukarPulsa({Key? key}) : super(key: key);

  @override
  _TukarPulsaState createState() => _TukarPulsaState();
}

class _TukarPulsaState extends State<TukarPulsa> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
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
                              )),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            'Tukar Pulsa',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Masukkan Nomor Hp",
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      //*using theme data for change border color when clicked
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xffA0E547))),
                        child: TextFormField(
                            decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.perm_contact_calendar_outlined,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        itemCount: datas.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 20,
                          crossAxisCount: 3,
                          mainAxisExtent: 114,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: OperationCard(
                                operation: datas[index].name,
                                isSelected: current == index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
                  onPressed: () {},
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
      ),
    );
  }
}
