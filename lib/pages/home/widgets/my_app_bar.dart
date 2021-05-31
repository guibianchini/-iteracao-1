import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTap;

  const MyAppBar({Key? key, required this.showMenu, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ), //sizedbox

        GestureDetector(
          onTap: onTap,
          child: Container(
            color:
                Color(0xff01897d), //deixando o container da mesma cor da tela
            height: MediaQuery.of(context).size.height * .20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //alinhando container para o centro
                  children: <Widget>[
                    Image.network(
                      //'https://logospng.org/download/nubank/logo-nu-nubank-roxo-icon-4096.png', //link da imagem
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL3aGs03QCBnrqh62Mqptz-rx_hDGFWEsoVw&usqp=CAU',
                      height: 55, //tamanho da imagem
                      //color: Colors.white, //cor da imagem
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Professor/Aluno',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Icon(
                  !showMenu ? Icons.expand_more : Icons.expand_less,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
