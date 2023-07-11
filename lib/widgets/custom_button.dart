import 'package:flutter/material.dart';
import 'package:quizzler/const/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.titleText,
      required this.onPressed,
      required this.color});
  final String titleText;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          titleText,
          style: textStyles,
        ),
      ),
    );
  }
}
