import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_word/pages/home/homepage.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUIOverlayStyle.dark)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.blue, // cor da barra de navegação
      //statusBarColor: Colors.pink, // cor da barra de status
      statusBarBrightness: Brightness
          .dark //praticamente a mesma coisa do de cima mas no emulador não mudou nada pois a letra já é branca
      ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //removendo o selo de debug que aparece no app
      title: 'BigAtividade',
      theme: ThemeData(
        primarySwatch: Colors.teal, // definindo cor primária = roxa
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}
