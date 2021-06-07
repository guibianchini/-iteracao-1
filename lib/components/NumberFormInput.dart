import 'package:flutter/material.dart';

class NumberFormInput extends StatelessWidget {
  const NumberFormInput(
      {Key? key,
      required this.size,
      required TextEditingController formController,
      required this.icon,
      required this.validator})
      : _formController = formController,
        super(key: key);

  final Size size;
  final TextEditingController _formController;
  final IconData icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1.5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
          keyboardType: TextInputType.number,
          controller: _formController,
          style: TextStyle(
            color: Color(0xcc313131),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Color(0xed313131),
            ),
            border: InputBorder.none,
          ),
          validator: validator),
    );
  }
}
