import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/utilities/field/field.dart';
import 'package:kakuro_game/widgets/time/stopwatch.dart';



class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = Field(5, 5);

    return 
       Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Kakuro!"),
      ),
      // Background color of the screen.
      backgroundColor: backgroundColor,
      // Place buttons in the center of screen.
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Stopwatch(),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Center(
                      child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 2,
                    // Arrange rows of buttons in a column.
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: f.getRows(),
                    ),
                  ))))
        ],
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
    );
  }
}
