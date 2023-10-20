import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  VoidCallback onPressed;

  AppButton(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
