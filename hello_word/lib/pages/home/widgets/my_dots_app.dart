import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;

  Color getColor(index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  const MyDotsApp({Key? key, required this.currentIndex, required this.top})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 160,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 15,
            decoration:
                BoxDecoration(color: getColor(0), shape: BoxShape.circle),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 15,
            decoration:
                BoxDecoration(color: getColor(1), shape: BoxShape.circle),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 15,
            decoration:
                BoxDecoration(color: getColor(2), shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
