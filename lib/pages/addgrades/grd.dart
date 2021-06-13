import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_word/components/NumberFormInput.dart';
import 'package:hello_word/models/user.dart';
import 'package:provider/provider.dart';

import '../pages.dart' as pages;

import '../../AppState.dart';
import '../../components/TextBox.dart';

@immutable
class GradesPageAdd extends StatefulWidget {
  GradesPageAdd({Key? key, required this.user}) : super(key: key);
  final Student user;

  @override
  _GradesPageAddState createState() => _GradesPageAddState();
}

class _GradesPageAddState extends State<GradesPageAdd> {
  TextEditingController _n1Controller = TextEditingController();
  TextEditingController _n2Controller = TextEditingController();

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
                NumberFormInput(
                    size: MediaQuery.of(context).size,
                    formController: _n1Controller,
                    icon: Icons.assignment,
                    validator: (value) {
                      if (value!.isEmpty || double.tryParse(value) == null) {
                        return 'Entre com um número';
                      }
                    }),
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
                NumberFormInput(
                  formController: _n2Controller,
                  icon: Icons.assignment,
                  size: MediaQuery.of(context).size,
                  validator: (value) {
                    if (value!.isEmpty || double.tryParse(value) == null) {
                      return 'Entre com um número';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<AppState>(
                    builder: (context, appState, _) => TextBox(
                        text: 'CONFIRMAR',
                        press: () {
                          final n1 = gradeParse(_n1Controller.text);
                          final n2 = gradeParse(_n2Controller.text);
                          appState.updateGrades(widget.user, n1, n2);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => pages.HomePage()));
                        }))
              ],
            ),
          ),
        ));
  }
}

double gradeParse(String input) => max(0, min(10, double.tryParse(input) ?? 0));
