import 'package:flutter/material.dart';
import 'package:hello_word/pages/home/data/data_users.dart';
import 'package:hello_word/pages/home/widgets/user_tile.dart';
//import 'package:hello_word/pages/home/data/data_users.dart';

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...data_Users};
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
          ),
        ));
  }
}
