import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee App',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DiceePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DiceePage extends StatefulWidget {
  const DiceePage({Key? key}) : super(key: key);

  @override
  _DiceePageState createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text(
          "Diceee App",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Image.asset(
                    "images/dice$leftDiceNumber.png",
                    color: Colors.amber,
                  )),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Image.asset(
                    "images/dice$rightDiceNumber.png",
                    color: Colors.amber,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
