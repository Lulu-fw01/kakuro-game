import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/// Main menu screen of kakuro-game.
class MenuScreen extends StatelessWidget {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: MaterialButton(
                  color: Colors.pink[100],
                  height: 50.0,
                  minWidth: 150.0,
                  child: Text(
                    "Play",
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