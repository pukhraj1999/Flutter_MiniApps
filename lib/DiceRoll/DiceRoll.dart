import 'package:basic/DiceRoll/MyText.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceRoll());

class DiceRoll extends StatefulWidget {
  const DiceRoll({Key key}) : super(key: key);

  @override
  _DiceRollState createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  Color myTheme = Colors.blue;
  List<String> list = [
    "dice1.png",
    "dice2.png",
    "dice3.png",
    "dice4.png",
    "dice5.png",
    "dice6.png"
  ];
  String result = "Welcome";
  int x = 0, y = 1;

  void onChange() {
    Random rand = new Random();
    x = rand.nextInt(5 - 0);
    y = rand.nextInt(5 - 0);

    if (x == y) {
      setState(() {
        result = "Draw";
      });
    } else if (x > y) {
      setState(() {
        result = "Player 1 wins";
      });
    } else {
      setState(() {
        result = "Player 2 wins";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: MyText(text: "DiceRoll", size: 30),
          centerTitle: true,
          backgroundColor: myTheme,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: myTheme,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child:
                        MyText(text: result, size: 40, myColor: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText(text: "Player 1", size: 30, myColor: Colors.orange),
                    MyText(text: "Player 2", size: 30, myColor: Colors.orange)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        "assets/dices/" + list[x],
                        scale: 2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        "assets/dices/" + list[y],
                        scale: 2,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: myTheme,
                  ),
                  onPressed: onChange,
                  child: MyText(text: "Play", size: 60),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: myTheme,
          child: MyText(
            text: "D",
            size: 30,
          ),
          onPressed: () {
            Random rand = new Random();
            int r = rand.nextInt(255 - 0);
            int g = rand.nextInt(255 - 0);
            int b = rand.nextInt(255 - 0);
            setState(() {
              myTheme = Color.fromARGB(255, r, g, b);
            });
          },
        ),
      ),
    );
  }
}
