import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/models/field_settings/field_settings.dart';
import 'package:kakuro_game/screens/game_screen/game_screen.dart';
import 'dart:developer';


/// Main menu screen of kakuro-game.
class MenuScreen extends StatelessWidget {
  /// Route of this screen.
  static const routeName = "/home";

  const MenuScreen({Key? key}) : super(key: key);

  static const _sizes = ['8', '9', '10', '11', '12', '13', '14', '15'];
  static const _difficulties = ['Beginner', 'Easy', 'Medium', 'Hard'];

  void _onButtonPlayClicked(BuildContext context, final int _height, final int _width, final int _difficulty) {
    // TODO uncomment.
    //Navigator.pushNamed(context, GameScreen.routeName, arguments: FieldSettings(_height, _width, _difficulty));

    log('Play button click, go to game screen with parameters: height: $_height, width: $_width and difficulty: $_difficulty');
    Navigator.pushNamed(context, GameScreen.routeName, arguments: FieldSettings(5, 5, _difficulty));
  }

  @override
  Widget build(BuildContext context) {
    int _heightIndex = 0;
    int _widthIndex = 0;
    int _difficultyIndex = 0;

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
            children: <Widget>[
              _menuScreenButton(
                  text: 'Play',
                  onClick: () => _onButtonPlayClicked(context, _heightIndex + 8,
                      _widthIndex + 8, 4 - _difficultyIndex)),

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
                child: _parameterList(
                    values: _difficulties,
                    onSelectedItemChanged: (int index) =>
                        {_difficultyIndex = index},
                    label: 'difficulty'),
              ),

              _menuScreenButton(text: "Rules", onClick: () => {})
            ],
          ),
        ));
  }

  /// Widget which contains [ListWheelScrollView].
  /// In this widget user can select parameter value.
  Widget _parameterList(
          {required List<String> values,
          required void Function(int)? onSelectedItemChanged,
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

  /// Button for menu screen.
  Widget _menuScreenButton(
          {String text = "", required void Function()? onClick}) =>
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
              text,
              style: const TextStyle(color: buttonContentColor, fontSize: 20.0),
            ),
            onPressed: onClick,
          ));
}
