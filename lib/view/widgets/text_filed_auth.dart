import 'package:flutter/material.dart';

class TextFiledAuth extends StatelessWidget {
  Function(String) onChanged;
  String title;
  bool obscureText;
  TextFiledAuth({
    required this.obscureText,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
     
      obscureText: obscureText,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: title,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
