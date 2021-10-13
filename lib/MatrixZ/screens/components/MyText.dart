import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(this.text, this.Size, this.myColor, {Key key}) : super(key: key);

  final String text;
  final double Size;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: Size, fontWeight: FontWeight.bold, color: myColor));
  }
}

