//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hello_word/components/my_app_bar.dart';
import 'package:hello_word/components/my_dots_app.dart';
import 'package:hello_word/components/page_view_app.dart';

import '../pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _yPosition = _screenHeight * 0.24;

    return Scaffold(
      backgroundColor: Color(0xff01897d),
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/logo.png'),
          width: 70,
          height: 70,
        ),
        backgroundColor: Color(0xff01897d),
      ),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
            child: Text(
              'Opções',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff01897d),
            )),
        ListTile(
          leading: Icon(Icons.app_registration_outlined),
          title: Text('Registrar Aluno'),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Signup()))
          },
        ),
        ListTile(
          leading: Icon(Icons.add_box_outlined),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => GradesPage()))
          },
          title: Text('Adicionar Nota'),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app_outlined),
          title: Text('Sair'),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()))
          },
        ),
      ])),
      body: Stack(
        children: <Widget>[
          MyAppBar(),
          PageViewApp(
            top: _yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeight * 0.75;
              double positionTopLimit = _screenHeight * 0.24;
              double middlePosition =
                  (positionBottomLimit - positionTopLimit) / 2;
              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + middlePosition - 50
                          ? positionBottomLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit - middlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;
              });
            },
          ),
          MyDotsApp(
            top: _screenHeight * 0.70,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}
