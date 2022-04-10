import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';


/// Main menu screen of kakuro-game.
class MenuScreen extends StatelessWidget {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: buttonContentColor);

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Background color of the screen.
        backgroundColor: backgroundColor,
        // Place buttons in the center of screen.
        body: Center(
          // Arrange buttons in a column.
          child: Column(
            // Button alignment vertically and centered.
            mainAxisAlignment: MainAxisAlignment.center,
            // List of elements inside.
            children: <Widget> [
              Padding(
                // Indent from the top border.
                padding: const EdgeInsets.only(top: 25.0),
                child: MaterialButton(
                  // Button color.
                  color: buttonColor,
                  // Button height.
                  height: 50.0,
                  // button minimal width.
                  minWidth: 150.0,
                  // Text inside of the button.
                  child: Text(
                    "Play",
                    style: _sizeTextBlack,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, gameRoute);
                    },
                )
              ),
              Padding(
                // Indent from the "Play" button.
                padding: const EdgeInsets.only(top: 25.0),
                child: MaterialButton(
                  color: buttonColor,
                  height: 50.0,
                  minWidth: 150.0,
                  child: Text(
                    "Settings",
                    style: _sizeTextBlack,
                  ),
                  onPressed: () {  },
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: MaterialButton(
                  color: buttonColor,
                  height: 50.0,
                  minWidth: 150.0,
                  child: Text(
                    "Rules",
                    style: _sizeTextBlack,
                  ),
                  onPressed: () {  },
                )
              )
            ],
          ),
        )
      );
  }
}