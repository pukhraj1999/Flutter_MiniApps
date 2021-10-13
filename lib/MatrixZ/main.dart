import 'package:flutter/material.dart';
import "./screens/matrix.dart";
import "./screens/result.dart";

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/":(context)=>Matrix(),
      "/result":(context)=>Result(),
    },
  ));
}