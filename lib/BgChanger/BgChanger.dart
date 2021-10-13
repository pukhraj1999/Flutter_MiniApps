import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BgChanger());

class BgChanger extends StatefulWidget {
  @override
  _BgChangerState createState() => _BgChangerState();
}

class _BgChangerState extends State<BgChanger> {
  Color color = Colors.green;
  Random rand = new Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Bg Changer", style: TextStyle(fontSize: 25)),
            backgroundColor: color,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Suggester("Red", Colors.red),
                Suggester("Blue", Colors.blue),
                Suggester("Green", Colors.green),
                Suggester("Pink", Colors.pink),
                Suggester("Purple", Colors.purple),
                Suggester("Orange", Colors.orange),
                Suggester("Grey", Colors.grey),
                Suggester("Yellow", Colors.yellow),
                Suggester("Black", Colors.black),
                Suggester("Cyan", Colors.cyan),
                Suggester("Brown", Colors.brown),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              int r = rand.nextInt(255 - 0);
              int g = rand.nextInt(255 - 0);
              int b = rand.nextInt(255 - 0);
              setState(() {
                color = Color.fromARGB(255, r, g, b);
              });
            },
            child: Text("C", style: TextStyle(fontSize: 30)),
            backgroundColor: color,
          ),
        ));
  }

  Widget Suggester(String colorName, Color myColor) {
    return GestureDetector(
        onTap: () {
          setState(() {
            color = myColor;
          });
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(colorName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
          decoration: BoxDecoration(color: myColor),
        ));
  }
}
