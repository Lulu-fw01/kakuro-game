import 'package:flutter/material.dart';
import 'package:kakuro_game/models/app_properties/app_properties.dart';
import 'package:kakuro_game/utilities/field/field.dart';



class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = Field();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: AppProperties.appBarColor,
        title: const Text("Kakuro!"),
      ),
      // Background color of the screen.
      backgroundColor: AppProperties.backgroundColor,
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
    ));
  }
}
