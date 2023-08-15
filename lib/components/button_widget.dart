import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Color color;
  String text;
  double font;
  ButtonWidget({
    super.key,
    required this.color,
    required this.text,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: AlignmentDirectional.center,
      height: 60,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Text(text,
          style: TextStyle(
              fontSize: font,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
