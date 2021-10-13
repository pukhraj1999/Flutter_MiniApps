import 'package:flutter/material.dart';
import 'MyText.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(this.text, this.Size, this.myColor, {Key key})
      : super(key: key);

  final String text;
  final double Size;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: MyText(text, Size, Colors.white),
    );
  }
}