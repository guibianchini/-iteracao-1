import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/TextBox.dart';
import '../pages/home/homepage.dart';

enum LoginState { notLogged, loggedIn, loginError }

class Auth extends StatelessWidget {
  final LoginState loginState;
  final Future<LoginState> Function(
          String, String, Function(FirebaseAuthException))
      logInWithEmailAndPassword;
  final void Function() signOut;
  const Auth(
      {required this.loginState,
      required this.logInWithEmailAndPassword,
      required this.signOut});

  @override
  Widget build(BuildContext context) {
    if (loginState == LoginState.notLogged) {
      return TextBox(
          text: 'Login',
          press: () async {
            await logInWithEmailAndPassword("teste@mail.com", '123456',
                (error) {
              _showErrorDialog(context, "Login error", error);
            }).then((value) => {
                  if (value == LoginState.loggedIn)
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => (HomePage())))
                    }
                });
          });
    } else {
      return TextBox(
        text: 'Login',
        press: () => {},
      );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
