import 'package:flutter/material.dart';

import 'BoxContainer.dart';

class BoxInputField extends StatelessWidget {
  final IconData icon;
  final ValueChanged<String> onChanged;
  const BoxInputField({
    Key? key,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: TextField(
        style: TextStyle(
          color: Color(0xcc313131),
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xed313131),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
