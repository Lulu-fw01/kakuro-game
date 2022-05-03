import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';


/// Main menu screen of kakuro-game.
class MenuScreen extends StatelessWidget {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: buttonContentColor);

  MenuScreen({Key? key}) : super(key: key);

  static const _sizes = ['8', '9', '10', '11', '12', '13', '14', '15'];
  static const _difficulties = ['Beginner', 'Easy', 'Medium', 'Hard'];


  int _heightIndex = 2;
  int _widthIndex = 2;
  int _difficultyIndex = 1;

  void _onButtonPlayClicked(BuildContext context) {
    Navigator.pushNamed(context, gameRoute);
  }

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
                  onPressed: () => _onButtonPlayClicked(context),
                )
              ),
              
              // TODO make more beautiful part with lists.
              Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  _parameterList(
                      values: _sizes,
                      onSelectedItemChanged: (int index) =>
                          {_heightIndex = index},
                      label: 'height'),
                      const SizedBox(width: 25),
                  _parameterList(
                      values: _sizes,
                      onSelectedItemChanged: (int index) =>
                          {_widthIndex = index},
                      label: "width"),
                    ],
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child:
                    _parameterList(values: _difficulties, label: 'difficulty'),
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

  Widget _parameterList(
          {required List<String> values,
          void Function(int)? onSelectedItemChanged,
          String label = ""}) =>
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: fourthColor),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 70,
                  width: values[0].length > 2 ? 150 : 60,
                  child: ListWheelScrollView.useDelegate(
                    useMagnifier: true,
                    magnification: 1.7,
                    diameterRatio: 1,
                    squeeze: 1.8,
                    itemExtent: 50,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                        childCount: values.length,
                        builder: (BuildContext context, int index) {
                          if (index < 0 || index > values.length) {
                            return null;
                          }
                          return _listSizeValue(value: values[index]);
                        }),
                    onSelectedItemChanged: onSelectedItemChanged,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(label, style: const TextStyle(fontSize: 14)),
                )
              ]));

  Widget _listSizeValue({required String value}) => Center(
      child: Container(
          width: value.length > 2 ? 60 : 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: buttonColor, width: 0.7),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              color: buttonColor),
          child: Center(
              child: Text(
            value,
            style: const TextStyle(color: buttonContentColor, fontSize: 14),
          ))));
}
