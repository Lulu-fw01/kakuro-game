import 'package:flutter/cupertino.dart';
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
                  padding: const EdgeInsets.only(top: 25), 
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                          _parameterList("height"),
                          _parameterList("width"),
                          _parameterList("difficulty"),
                    ],
                  ))),
                      
                    
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

  // TODO add list of values in parameters, add function in parameters.
  // TODO use ListWheelScrollView.useDelegate
  Widget _parameterList([String label = ""]) => Container(
    decoration: BoxDecoration(border: Border.all(width: 3, color: fourthColor),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
    child:
      Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          height: 70,
          width: 60,
          child: ListWheelScrollView(
            useMagnifier: true,
            magnification: 1.7,
            diameterRatio: 1,
            squeeze: 1.8,
            itemExtent: 50,
            physics: const FixedExtentScrollPhysics(),
            children: [
              _listValue(value: "9"),
              _listValue(value: "10"),
              _listValue(value: "11"),
              _listValue(value: "12"),
              _listValue(value: "13"),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(bottom: 8), child: 
        Text(label, style: const TextStyle(fontSize: 14)),)
      ]));

 Widget _listValue({required String value}) => Center(
      child: Container(
          width: 30,
          height: 30,
          decoration:
              BoxDecoration(border: Border.all(color: buttonColor, width: 0.7),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              color: buttonColor),
          child: Center(
              child: Text(
            value,
            style: const TextStyle(color: buttonContentColor, fontSize: 14),
          ))));
}
