import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {                         //We use stateful widgets for apps where there's functioning going around.
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  void leftright(){
    leftDiceNum = Random().nextInt(6) + 1;
    rightDiceNum = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(                           //Creates a widget that expands a child of a Row, Column, or Flex so that the child fills the available space along the flex widget's main axis
            child: TextButton(
              onPressed: () {           //on pressed should have an anonymous function, i.e no arguments or no names
                setState(               //this is used for only changing the numbers, or else we'd have to restart the whole application again to see the changes. It looks for the difference in the code while running it and applies the changes.
                  () {
                    leftright();
                  },
                );
              },
              child: Image.asset('Images/dice$leftDiceNum.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  leftright();
                });
              },
              child: Image.asset('Images/dice$rightDiceNum.png'),
            ),
          )
        ],
      ),
    );
  }
}
