import 'package:flutter/material.dart';

import '../pages.dart';

class HomePageAluno extends StatefulWidget {
  @override
  _HomePageAlunoState createState() => _HomePageAlunoState();
}

class _HomePageAlunoState extends State<HomePageAluno> {
  final users = {};

  @override
  Widget build(BuildContext context) {
    double nota1 = 5;
    double nota2 = 7;
    double media = (nota1 + nota2) / 2;

    return Scaffold(
      backgroundColor: Colors.teal,
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
          leading: Icon(Icons.exit_to_app_outlined),
          title: Text('Sair'),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()))
          },
        ),
      ])),
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              'Nota 1: $nota1',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nota 2: $nota2',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Média: $media',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ])),
    );
  }
}
