import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const FormButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.purple[900], borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
