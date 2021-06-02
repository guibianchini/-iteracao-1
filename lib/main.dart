import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/pages.dart' as pages;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setSystemUIOverlayStyle(SystemUIOverlayStyle.dark)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.blue, // cor da barra de navegação
      //statusBarColor: Colors.pink, // cor da barra de status
      statusBarBrightness: Brightness
          .dark //praticamente a mesma coisa do de cima mas no emulador não mudou nada pois a letra já é branca
      ));
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //Placeholder enquanto não tem a confguração do firebase kkkkkk
  final Future<String> _future =
      Future<String>.delayed(const Duration(seconds: 10), () => "Placeholder");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Exemplo();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  //Mentira kkkkkkkkkkkkkkkkkk0
                  child: Text('Carregando Firebase...'),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}

class Exemplo extends StatelessWidget {
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
      home: pages.HomePage(),
    );
  }
}
