import 'package:flutter/material.dart';

import 'package:hello_word/components/user_tile.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = {};
    return Scaffold(
      appBar: AppBar(
          elevation: 20,
          centerTitle: true,
          backgroundColor: Color(0xff01897d),
          title: Image(
            image: AssetImage('assets/logo.png'),
            height: 72,
          )),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) =>
              UserTileGrade(users.values.elementAt(i))),
    );
  }
}
