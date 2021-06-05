//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hello_word/components/users_data.dart';
import 'package:hello_word/components/user_tile.dart';

import '../pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final users = {...data_Users};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/logo.png'),
              width: 70,
              height: 70,
            ),
            SizedBox(width: 20,),
            Text('Página Inicial'),
            SizedBox(width: 90,),
          ],
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
          ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) =>
              UserTileGrade(users.values.elementAt(i))),

        ],
      ),
    );
  }
}
