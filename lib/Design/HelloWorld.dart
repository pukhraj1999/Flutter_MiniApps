import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar:AppBar(
        title:Text(
          "Learning Begins",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
            ),
          ),
        backgroundColor: Colors.grey,
      ),
      body:
        Center(
          child: Text(
            "hello World!",
            style:TextStyle(
              fontSize:60,
              fontWeight: FontWeight.bold,
            )
            ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "+",
          style:TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          )
        ),
        onPressed: ()=>{},
        backgroundColor: Colors.grey,
      ),
    ),
  ));
}
