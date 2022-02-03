import 'package:flutter/material.dart';
import 'package:kakuro_game/models/app_properties/app_properties.dart';


/// Main menu screen of kakuro-game.
class MenuScreen extends StatelessWidget {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Bsckground color of the screen.
        backgroundColor: AppProperties.getBackgroundColor(),
        // Place buttons in the center of screen.
        body: Center(
          // Arrange buttons in a collumn.
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
                  color: AppProperties.getButtonColor(),
                  // Button height.
                  height: 50.0,
                  // button minimal width.
                  minWidth: 150.0,
                  // Text inside of the button.
                  child: Text(
                    "Play",
                    style: _sizeTextBlack,
                  ),
                  onPressed: () {  },
                )
              ),
              Padding(
                // Indent from the "Play" button.
                padding: const EdgeInsets.only(top: 25.0),
                child: MaterialButton(
                  color: AppProperties.getButtonColor(),
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
                  color: AppProperties.getButtonColor(),
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
      )
    );
  }
}