import 'package:flutter/material.dart';

class DoneBar extends StatelessWidget {
  final int count;
  final double percentDone;

  DoneBar(this.count, this.percentDone);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            '$count',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // child: SizedBox(
                    //   height: 12,
                    // ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percentDone,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      color: Colors.indigo,
    );
  }
}
