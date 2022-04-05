import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/utilities/field/field.dart';



class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = Field(5, 5);

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Kakuro!"),
      ),
      // Background color of the screen.
      backgroundColor: backgroundColor,
      // Place buttons in the center of screen.
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 1.6,
          // Arrange rows of buttons in a column.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: f.getRows(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: thirdColor,
        iconSize: 24,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: buttonColor), label: "Main menu"),
          BottomNavigationBarItem(icon: Icon(Icons.timer, color: buttonColor), label: "Timer"),
          BottomNavigationBarItem(icon: Icon(Icons.help, color: buttonColor), label: "Help" ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        ),
    ));
  }
}
