import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({ Key key ,@required this.text,@required this.size,this.myColor}) : super(key: key);
  
  final String text;
  final double size;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        color:myColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
      )
    );
  }
}