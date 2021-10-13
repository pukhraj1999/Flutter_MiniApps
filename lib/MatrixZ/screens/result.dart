import 'package:flutter/material.dart';
import './components/MyText.dart';
import './components/MyContainer.dart';

class Result extends StatefulWidget {
  const Result({Key key, this.A, this.B}) : super(key: key);

  final dynamic A;
  final dynamic B;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  dynamic Res;

  void OnChange(String x) {
    if (x == "add") {
      setState(() {
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            Res[i][j] = widget.A[i][j] + widget.B[i][j];
          }
        }
      });
    }
    if (x == "sub") {
      setState(() {
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            Res[i][j] = widget.A[i][j] - widget.B[i][j];
          }
        }
      });
    }
    if (x == "mul") {
      setState(() {
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            Res[i][j] = 0;
            for (int k = 0; k < 3; k++) {
              Res[i][j] += widget.A[i][k] * widget.B[k][j];
            }
          }
        }
      });
    }
    if (x == "B") {
        setState(() {
          Res[0][0] = widget.B[0][0];
          Res[1][1] = widget.B[1][1];
          Res[2][2] = widget.B[2][2];
          Res[0][1] = widget.B[1][0];
          Res[0][2] = widget.B[2][0];
          Res[1][0] = widget.B[0][1];
          Res[1][2] = widget.B[2][1];
          Res[2][1] = widget.B[1][2];
          Res[2][0] = widget.B[0][2];
        });      
    }
    if (x == "A") {
      setState(() {
        Res[0][0] = widget.A[0][0];
        Res[1][1] = widget.A[1][1];
        Res[2][2] = widget.A[2][2];
        Res[0][1] = widget.A[1][0];
        Res[0][2] = widget.A[2][0];
        Res[1][0] = widget.A[0][1];
        Res[1][2] = widget.A[2][1];
        Res[2][1] = widget.A[1][2];
        Res[2][0] = widget.A[0][2];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      Res = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: MyText("MatrixZ", 30, Colors.white),
            backgroundColor: Colors.green[300],
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                              padding: EdgeInsets.all(8)),
                          onPressed: () => {OnChange("add")},
                          child: MyText("Add", 30, Colors.white)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[300],
                            padding: EdgeInsets.all(8),
                          ),
                          onPressed: () => {OnChange("sub")},
                          child: MyText("Subtract", 30, Colors.white)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {OnChange("mul")},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[300],
                    padding: EdgeInsets.all(8),
                  ),
                  child: MyText("Multiply", 30, Colors.white),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                              padding: EdgeInsets.all(8)),
                          onPressed: () => {OnChange("A")},
                          child: MyText("Transpose A", 30, Colors.white)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                              padding: EdgeInsets.all(8)),
                          onPressed: () => {OnChange("B")},
                          child: MyText("Transpose B", 30, Colors.white)),
                    ],
                  ),
                ),
                MyContainer("Result", 60, Colors.purple),
                MXRow(Res[0][0].toString(), Res[0][1].toString(),
                    Res[0][2].toString()),
                MXRow(Res[1][0].toString(), Res[1][1].toString(),
                    Res[1][2].toString()),
                MXRow(Res[2][0].toString(), Res[2][1].toString(),
                    Res[2][2].toString()),
              ],
            ),
          ),
        ));
  }

  Widget MXRow(String a, String b, String c) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyText(a, 60, Colors.black),
        MyText(b, 60, Colors.black),
        MyText(c, 60, Colors.black),
      ],
    );
  }
}
