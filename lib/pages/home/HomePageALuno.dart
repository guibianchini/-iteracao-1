import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../pages.dart' as pages;

class HomePageAluno extends StatefulWidget {
  HomePageAluno({required this.student});
  final Student student;
  @override
  _HomePageAlunoState createState() => _HomePageAlunoState();
}

class _HomePageAlunoState extends State<HomePageAluno> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => pages.LoginPage()))
                },
              ),
            ])),
            body: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.student.name}',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Nota 1: ${widget.student.n1}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nota 2: ${widget.student.n2}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Média: ${(widget.student.n1 + widget.student.n2) / 2}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Usuário estudante: ${widget.student.name}",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
