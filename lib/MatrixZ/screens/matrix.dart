import 'package:flutter/material.dart';
import './components/MyText.dart';
import './components/MyContainer.dart';
import "./result.dart";

class Matrix extends StatefulWidget {
  const Matrix({Key key}) : super(key: key);

  @override
  _MatrixState createState() => _MatrixState();
}

class _MatrixState extends State<Matrix> {
  //First Matrix
  TextEditingController Ma1;
  TextEditingController Ma2;
  TextEditingController Ma3;
  TextEditingController Mb1;
  TextEditingController Mb2;
  TextEditingController Mb3;
  TextEditingController Mc1;
  TextEditingController Mc2;
  TextEditingController Mc3;
  //Second Matrix
  TextEditingController Na1;
  TextEditingController Na2;
  TextEditingController Na3;
  TextEditingController Nb1;
  TextEditingController Nb2;
  TextEditingController Nb3;
  TextEditingController Nc1;
  TextEditingController Nc2;
  TextEditingController Nc3;
  List<List<int>> MatrixA = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  List<List<int>> MatrixB = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      //1st matrix
      Ma1 = new TextEditingController(text: "0");
      Ma2 = new TextEditingController(text: "0");
      Ma3 = new TextEditingController(text: "0");
      Mb1 = new TextEditingController(text: "0");
      Mb2 = new TextEditingController(text: "0");
      Mb3 = new TextEditingController(text: "0");
      Mc1 = new TextEditingController(text: "0");
      Mc2 = new TextEditingController(text: "0");
      Mc3 = new TextEditingController(text: "0");
      //2nd matrix
      Na1 = new TextEditingController(text: "0");
      Na2 = new TextEditingController(text: "0");
      Na3 = new TextEditingController(text: "0");
      Nb1 = new TextEditingController(text: "0");
      Nb2 = new TextEditingController(text: "0");
      Nb3 = new TextEditingController(text: "0");
      Nc1 = new TextEditingController(text: "0");
      Nc2 = new TextEditingController(text: "0");
      Nc3 = new TextEditingController(text: "0");
    });
  }

  void Fill() {
    setState(() {
      MatrixA = [
        [
          int.parse(Ma1.text.toString()),
          int.parse(Ma2.text.toString()),
          int.parse(Ma3.text.toString())
        ],
        [
          int.parse(Mb1.text.toString()),
          int.parse(Mb2.text.toString()),
          int.parse(Mb3.text.toString())
        ],
        [
          int.parse(Mc1.text.toString()),
          int.parse(Mc2.text.toString()),
          int.parse(Mc3.text.toString())
        ],
      ];
      MatrixB = [
        [
          int.parse(Na1.text.toString()),
          int.parse(Na2.text.toString()),
          int.parse(Na3.text.toString())
        ],
        [
          int.parse(Nb1.text.toString()),
          int.parse(Nb2.text.toString()),
          int.parse(Nb3.text.toString())
        ],
        [
          int.parse(Nc1.text.toString()),
          int.parse(Nc2.text.toString()),
          int.parse(Nc3.text.toString())
        ],
      ];
    });
  }

  void SendData() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Result(A:MatrixA,B:MatrixB),
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: MyText("MatrixZ", 30, Colors.white),
          centerTitle: true,
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: MyContainer("Matrix A", 40, Colors.green[300])),
              MatrixRow(Ma1, Ma2, Ma3),
              MatrixRow(Mb1, Mb2, Mb3),
              MatrixRow(Mc1, Mc2, Mc3),
              Center(child: MyContainer("Matrix B", 40, Colors.green[300])),
              MatrixRow(Na1, Na2, Na3),
              MatrixRow(Nb1, Nb2, Nb3),
              MatrixRow(Nc1, Nc2, Nc3),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                  onPressed: () {
                    Fill();
                    SendData();
                  },
                  child: MyText("Next", 30, Colors.white),
                ),
              )
            ],
          ),
        )));
  }

  Widget MatrixRow(TextEditingController A, TextEditingController B,
      TextEditingController C) {
    return Row(
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(hintText: "Number"),
              keyboardType: TextInputType.number,
              controller: A,
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(hintText: "Number"),
              keyboardType: TextInputType.number,
              controller: B,
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(hintText: "Number"),
              keyboardType: TextInputType.number,
              controller: C,
            ),
          ),
        ),
      ],
    );
  }
}
