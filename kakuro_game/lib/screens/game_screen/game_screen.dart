import 'package:flutter/material.dart';
import 'package:kakuro_game/models/app_properties/app_properties.dart';
import 'package:kakuro_game/utilities/field/field.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell.dart';
import 'package:kakuro_game/widgets/field/cell/value_cell.dart';



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
        // Arrange buttons in a collumn.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // TODO add method which returns list of rows filled with sized rows.
          children: f.getRows(),
          //children: ,
        ),
      ),
    ));
  }
}
