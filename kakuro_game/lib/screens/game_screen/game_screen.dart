import 'package:flutter/material.dart';
import 'package:kakuro_game/models/app_properties/app_properties.dart';



class GameScreen extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
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
            //children: ,
          ),
        ),
      )
    );
  }
}