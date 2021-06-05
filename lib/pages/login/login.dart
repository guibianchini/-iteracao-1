import 'package:flutter/material.dart';
import 'package:hello_word/components/BoxInputField.dart';
import 'package:hello_word/components/PasswordBox.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import 'package:hello_word/AppState.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                PasswordBox(onChanged: (value) {
                  setState(() {});
                }),
                SizedBox(height: size.height * 0.05),
                Consumer<AppState>(
                    builder: (context, appState, _) => Auth(
                          logInWithEmailAndPassword:
                              appState.signInWithEmailAndPassword,
                          loginState: appState.loginState,
                          signOut: appState.signOut,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
