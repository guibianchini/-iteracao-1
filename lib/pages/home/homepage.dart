//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hello_word/AppState.dart';
import 'package:hello_word/components/user_tile.dart';
import 'package:provider/provider.dart';

import '../pages.dart' as pages;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              elevation: 20,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/logo.png'),
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Página Inicial'),
                  SizedBox(
                    width: 90,
                  ),
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => pages.Signup()))
                },
              ),
              Consumer<AppState>(
                builder: (context, value, child) {
                  return ListTile(
                      leading: Icon(Icons.exit_to_app_outlined),
                      title: Text('Sair'),
                      onTap: () => {
                            value.signOut()
                          });
                },
              ),
            ])),
            body: Consumer<AppState>(
              builder: (context, appState, _) {
                return Stack(
                  children: [
                    ListView.builder(
                        itemCount: appState.students.length,
                        itemBuilder: (context, i) =>
                            UserTileGrade(appState.students.elementAt(i))),
                  ],
                );
              },
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<AppState>(
                  builder: (context, appstate, _) => Text(
                    "Usuário ADM:${appstate.currentUser!.displayName}",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
