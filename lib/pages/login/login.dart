import 'package:flutter/material.dart';
import 'package:hello_word/components/TextBox.dart';
import 'package:hello_word/models/user_type.dart';
import 'package:provider/provider.dart';

import '../../components/PasswordFormInput.dart';
import '../../components/TextFormInput.dart';
import 'package:hello_word/AppState.dart';
import '../pages.dart' as pages;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailFormController = TextEditingController();
  TextEditingController _passwordFormController = TextEditingController();

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
                TextFormInput(
                  size: size,
                  formController: _emailFormController,
                  icon: Icons.email,
                  validator: (value) {
                    return "Preencha esse campo!";
                  },
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
                PasswordFormInput(
                    size: size,
                    passwordFormController: _passwordFormController,
                    validator: (value) {}),
                SizedBox(height: size.height * 0.05),
                Consumer<AppState>(
                    builder: (context, appState, _) => TextBox(
                        text: 'Login',
                        press: () async {
                          UserType shouldNavigate = await appState
                              .signInWithEmailAndPassword(
                                  _emailFormController.text,
                                  _passwordFormController.text, (e) {
                            showDialog<void>(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Login Error"),
                                      content: Text(e.message!),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        )
                                      ],
                                    ));
                          });
                          if (shouldNavigate.cond) {
                            if (shouldNavigate.usertype == UserDesc.Admin) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => pages.HomePage()));
                            } else if (shouldNavigate.usertype ==
                                UserDesc.Student) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => pages.HomePageAluno(
                                      student: appState.currentStudent)));
                              _emailFormController.clear();
                              _passwordFormController.clear();
                            }
                          }
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
