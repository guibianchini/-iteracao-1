import 'package:flutter/material.dart';
import 'package:hello_word/components/BoxInputField.dart';
import 'package:hello_word/components/PasswordBox.dart';
import 'package:hello_word/components/TextBox.dart';

import '../pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xff01897d),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1),
                Image(
                  image: AssetImage('assets/logo.png'),
                  height: 72,
                ),
                Text(
                  'Professor/Aluno',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
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
                SizedBox(height: size.height * 0.05),
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
                SizedBox(height: size.height * 0.05),
                TextBox(
                    text: 'Login',
                    press: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
