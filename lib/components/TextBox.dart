import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final void Function()? press;
  const TextBox({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,
      child: ButtonTheme(
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            primary: Colors.teal[700],
            onPrimary: Colors.teal[800],
            padding: EdgeInsetsGeometry.lerp(
                EdgeInsets.zero, EdgeInsets.only(top: 8.5, bottom: 8.5), 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.transparent)),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
