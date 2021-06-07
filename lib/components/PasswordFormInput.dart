import 'package:flutter/material.dart';

class PasswordFormInput extends StatelessWidget {
  const PasswordFormInput(
      {Key? key,
      required this.size,
      required TextEditingController passwordFormController,
      required this.validator})
      : _passwordFormController = passwordFormController,
        super(key: key);

  final Size size;
  final TextEditingController _passwordFormController;
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
        controller: _passwordFormController,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xcc313131),
          ),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
