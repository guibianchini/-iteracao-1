import 'package:flutter/material.dart';
import 'package:hello_word/models/user.dart';
import '../pages/pages.dart';

class UserTileGrade extends StatefulWidget {
  final Student user;
  const UserTileGrade(this.user);

  @override
  _UserTileGradeState createState() => _UserTileGradeState();
}

class _UserTileGradeState extends State<UserTileGrade> {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final avatar = CircleAvatar(
      child: Icon(Icons.person),
    );
    return Container(
      child: ListTile(
          leading: avatar,
          title: Text(widget.user.name == null ? "Teste" : widget.user.name!),
          subtitle: Text(widget.user.email!),
          trailing: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GradesPageAdd()));
              },
              child: Icon(Icons.add))),
    );
  }
}
