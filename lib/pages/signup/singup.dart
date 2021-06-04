import 'package:flutter/material.dart';
import 'package:hello_word/components/BoxInputField.dart';
import 'package:hello_word/components/PasswordBox.dart';
import 'package:hello_word/components/TextBox.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 20,
          centerTitle: true,
          backgroundColor: Color(0xff01897d),
          title: Image(
            image: AssetImage('assets/logo.png'),
            height: 72,
          )),
      body: Container(
        color: Color(0xff01897d),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.003),
                SizedBox(height: size.height * 0.05),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                BoxInputField(
                  icon: Icons.person,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                BoxInputField(
                  icon: Icons.email,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                PasswordBox(onChanged: (value) {}),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                PasswordBox(onChanged: (value) {}),
                TextBox(
                    text: 'SIGN UP',
                    press: () {
                      print('oi');
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
