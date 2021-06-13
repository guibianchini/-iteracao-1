import 'package:flutter/material.dart';

import 'package:hello_word/components/BoxContainer.dart';

class PasswordBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordBox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xcc313131),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
