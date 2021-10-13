import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  Color myTheme = Colors.purple;
  List<String> show = ["", "", "", "", "", "", "", "", ""];
  List<Color> padColor = List.filled(9, null);
  bool turn = true;
  String result = "Welcome";

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 9; i++) padColor[i] = myTheme;
  }

  void Match(int x, int y, int z) {
    if (show[x] == show[y] && show[y] == show[z] && show[x] == "X") {
      setState(() {
        result = "Player 1 Wins";
        padColor[x] = Colors.orange;
        padColor[y] = Colors.orange;
        padColor[z] = Colors.orange;
      });
    }
    if (show[x] == show[y] && show[y] == show[z] && show[x] == "O") {
      setState(() {
        result = "Player 2 Wins";
        padColor[x] = Colors.orange;
        padColor[y] = Colors.orange;
        padColor[z] = Colors.orange;
      });
    }
  }

  void NoMatch() {
    int count = 0;
    for (int i = 0; i < 9; i++) {
      if (show[i] != "") count++;
    }
    if (count == 9) {
      setState(() {
        result = "Draw";
      });
    }
    print(count);
  }

  void onChange(int pos) {
    //Turn of player
    if (turn && show[pos] == "") {
      setState(() {
        show[pos] = "X";
        turn = false;
      });
    }
    if (!turn && show[pos] == "") {
      setState(() {
        show[pos] = "O";
        turn = true;
      });
    }
    //logic of game winner
    //horizontal
    Match(0, 1, 2);
    Match(3, 4, 5);
    Match(6, 7, 8);

    //Vertical
    Match(0, 3, 6);
    Match(1, 4, 7);
    Match(2, 5, 8);

    //Diagonal
    Match(0, 4, 8);
    Match(2, 4, 6);

    //Draw
    NoMatch();
  }

  void Restart() {
    setState(() {
      for (int i = 0; i < 9; i++) show[i] = "";
      for (int i = 0; i < 9; i++) padColor[i] = myTheme;
      result = "Welcome";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "TicTacToe",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: myTheme,
          ),
          body: Container(
            margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: myTheme,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  result,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Window(show[0], show[1], show[2], padColor[0], padColor[1],
                  padColor[2], 0, 1, 2),
              Window(show[3], show[4], show[5], padColor[3], padColor[4],
                  padColor[5], 3, 4, 5),
              Window(show[6], show[7], show[8], padColor[6], padColor[7],
                  padColor[8], 6, 7, 8),
              RestartButton()
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Random rand = Random();
              int r = rand.nextInt(255 - 0);
              int g = rand.nextInt(255 - 0);
              int b = rand.nextInt(255 - 0);
              setState(() {
                myTheme = Color.fromARGB(255, r, g, b);
              });
              for (int i = 0; i < 9; i++) padColor[i] = myTheme;
            },
            child: Text(
              "T",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            backgroundColor: myTheme,
          ),
        ));
  }

  Widget RestartButton() {
    return GestureDetector(
      onTap: Restart,
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            "Restart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget Window(String x, String y, String z, Color xColor, Color yColor,
      Color zColor, int pos1, int pos2, int pos3) {
    return Row(
      children: [
        Card(x, xColor, pos1),
        Card(y, yColor, pos2),
        Card(z, zColor, pos3),
      ],
    );
  }

  Widget Card(String text, Color myTheme, int pos) {
    return GestureDetector(
        onTap: () {
          onChange(pos);
        },
        child: Container(
          height: 100,
          width: 95,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: myTheme,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ));
  }
}
