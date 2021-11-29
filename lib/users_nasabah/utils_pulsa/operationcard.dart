import 'package:resik/model/PulsaModel.dart';
import 'package:flutter/material.dart';

class OperationCard extends StatefulWidget {
  final String? operation;
  final bool? isSelected;

  OperationCard({Key? key, this.operation, this.isSelected}) : super(key: key);

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
          border: Border.all(color: Color(0xff85d057)),
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected! ? Color(0xff85d057) : Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 9,
          ),
          Text(
            widget.operation!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Open Sans",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: widget.isSelected! ? Colors.white : Color(0xff85d057)),
          ),
        ],
      ),
    );
  }
}
