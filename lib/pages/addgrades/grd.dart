import 'package:flutter/material.dart';
import 'package:hello_word/components/BoxInputField.dart';
import 'package:hello_word/components/TextBox.dart';
import '../pages.dart';

class GradesPageAdd extends StatelessWidget {
  const GradesPageAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          centerTitle: true,
          title: Image(
            image: AssetImage('assets/logo.png'),
            height: 72,
          ),
          backgroundColor: Color(0xff01897d),
        ),
        body: Container(
          color: Color(0xff01897d),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      'Insira a Nota 1: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                BoxInputField(
                  icon: Icons.assignment,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      'Insira a Nota 2: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                BoxInputField(
                  icon: Icons.assignment,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 20,
                ),
                TextBox(
                    text: 'CONFIRMAR',
                    press: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    })
              ],
            ),
          ),
        ));
  }
}
