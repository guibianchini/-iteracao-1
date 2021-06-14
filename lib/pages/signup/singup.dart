import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hello_word/pages/pages.dart' as pages;

import 'package:hello_word/AppState.dart';

import 'package:hello_word/components/PasswordFormInput.dart';
import 'package:hello_word/components/TextBox.dart';
import 'package:hello_word/components/TextFormInput.dart';

class Signup extends StatelessWidget {
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reapeatPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => pages.HomePage()));
              },
            ),
            elevation: 20,
            centerTitle: true,
            backgroundColor: Color(0xff01897d),
            title: Image(
              image: AssetImage('assets/logo.png'),
              height: 72,
            )),
        body: Form(
            key: _formKey,
            child: Container(
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
                      TextFormInput(
                          size: size,
                          formController: _displayNameController,
                          icon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha esse campo!';
                            }
                          }),
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
                      TextFormInput(
                          size: size,
                          formController: _emailController,
                          icon: Icons.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha esse campo!';
                            }
                          }),
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
                      PasswordFormInput(
                          size: size,
                          passwordFormController: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha esse campo!';
                            }
                          }),
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
                      PasswordFormInput(
                          size: size,
                          passwordFormController: _reapeatPasswordController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value != _passwordController.text) {
                              return 'As senhas devem ser iguais!';
                            }
                          }),
                      Consumer<AppState>(
                        builder: (context, appState, _) => TextBox(
                            text: 'SIGN UP',
                            press: () async {
                              if (_formKey.currentState!.validate()) {
                                bool shouldNavigate = await appState
                                    .registerUser(
                                        _emailController.text,
                                        _displayNameController.text,
                                        _passwordController.text, (e) {
                                  showDialog<void>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text('Login Error'),
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
                                if (shouldNavigate) {
                                  print([_displayNameController]);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => pages.HomePage()));
                                }
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
