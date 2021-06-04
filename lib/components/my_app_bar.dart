import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ), //sizedbox

        Container(
          color: Color(0xff01897d), //deixando o container da mesma cor da tela
          height: MediaQuery.of(context).size.height * .20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //alinhando container para o centro
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Página Inicial',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
