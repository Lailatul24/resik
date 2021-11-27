import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resik/users_nasabah/alertDialog.dart';
import 'package:resik/model/PulsaModel.dart';

class TukarPulsa extends StatefulWidget {
  TukarPulsa({Key? key}) : super(key: key);

  @override
  _TukarPulsaState createState() => _TukarPulsaState();
}

List<Text> _data = [
  Text('12.000'),
  Text('7.000'),
  Text('22.000'),
  Text('32.000'),
];

class _TukarPulsaState extends State<TukarPulsa> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
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
              child: GridView.builder(
                itemCount: datas.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: OperationCard(
                        operation: datas[index].name,
                        selectedCard: datas[index].selectedIcon,
                        unselectedCard: datas[index].unselectedIcon,
                        isSelected: current == index,
                        context: this),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String? operation;
  final String? selectedCard;
  final String? unselectedCard;
  final bool? isSelected;
  _TukarPulsaState? context;
  OperationCard(
      {Key? key,
      this.operation,
      this.selectedCard,
      this.unselectedCard,
      this.isSelected,
      this.context})
      : super(key: key);

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(8.0, 8.0))
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected! ? Colors.blue : Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(widget.isSelected!
              ? widget.selectedCard!
              : widget.unselectedCard!),
          SizedBox(
            height: 9,
          ),
          Text(
            widget.operation!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Open Sans",
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected! ? Colors.white : Colors.blue),
          ),
        ],
      ),
    );
  }
}
