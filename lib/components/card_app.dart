import 'package:flutter/material.dart';
import 'package:hello_word/components/user_tile.dart';
import '../models/user.dart';

const data_Users = {
  '1': const User(
    id: '1',
    name: 'Hwa sa',
    email: 'maria@mail.uft.edu.br',
    avatarUrl:
        'https://i.pinimg.com/originals/3d/ba/6b/3dba6b723868f8c0285f938a31242314.jpg',
  ),
  '2': const User(
    id: '2',
    name: 'João',
    email: 'joao@mail.uft.edu.br',
    avatarUrl:
        'https://www.pngfind.com/pngs/m/341-3415733_male-portrait-avatar-face-head-black-hair-shirt.png',
  ),
};

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
