import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.titleText, required this.onPressed, this.color});
  final String titleText;
  final VoidCallback onPressed;
  final color;

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: MediaQuery.of(context).size.width,
               //height: 80,
              margin: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: color,
              ),
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  titleText,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            );
  }
}