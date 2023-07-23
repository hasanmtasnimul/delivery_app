import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final controller;
  final hintText;
  final isObscure;
  final fieldIcon;

  const FormTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
    required this.fieldIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
          // prefixIcon: new Icon(Icons.mail_outline_rounded),
          fillColor: Colors.white,
          prefixIcon: fieldIcon,
          hintText: hintText,
          labelText: hintText,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          filled: true),
    );
  }
}
