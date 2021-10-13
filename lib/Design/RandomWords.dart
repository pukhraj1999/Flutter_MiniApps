import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Words Suggestor",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey,
        ),
        body:RandomText()
      ),
    );
  }
}

class RandomText extends StatefulWidget {
  @override
  _RandomTextState createState() => _RandomTextState();
}

class _RandomTextState extends State<RandomText> {
  final List<WordPair> suggesions = <WordPair>[];
  final TextStyle biggerFont = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return ShowList();
  }

  Widget ShowList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        // The expression i ~/ 2 divides i by 2 and returns an integer result.
        //For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. This calculates
        //the actual number of word pairings in the ListView, minus the divider
        //widgets.
        final int index = i ~/ 2;

        if (index >= suggesions.length) {
          //If you’ve reached the end of the available word pairings, then 
          //generate 10 more and add them to the suggestions list.
          suggesions.addAll(generateWordPairs().take(10));
        }

        return buildRow(suggesions[index]);
      },
    );
  }

  Widget buildRow(WordPair wordPair) {
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: biggerFont,
      ),
    );
  }

}
