import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/utilities/field/field.dart';
import 'package:kakuro_game/widgets/options_floating_button/option_button.dart';
import 'package:kakuro_game/widgets/options_floating_button/options_floating_button.dart';
import 'package:kakuro_game/widgets/time/stopwatch.dart';


/// Screen with game field.
class GameScreen extends StatelessWidget {
  //Field field;

  const GameScreen({Key? key}) : super(key: key);

  void _toMenuScreen(BuildContext context) {
    Navigator.pushNamed(context, homeRoute);
  }

  void _changeTimerVisible(BuildContext context) {

  }

  void _showHint(BuildContext context) {

  }

  void _showAnswer(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    var f = Field(5, 5);

    return Scaffold(
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
              child: Visibility(
                visible: true,
                child: Stopwatch(),
              )
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
      floatingActionButton: OptionsFab(
        distance: 112.0,
        children: [
          OptionButton(
            onPressed: () => _toMenuScreen(context),
            icon: const Icon(Icons.home, color: buttonContentColor,),
          ),
          OptionButton(
            onPressed: () => _changeTimerVisible(context),
            icon: const Icon(Icons.timer, color: buttonContentColor,),
          ),
          OptionButton(
            onPressed: () => _showHint(context),
            icon: const Icon(Icons.done, color: buttonContentColor,),
          ),
          OptionButton(
            onPressed: () => _showAnswer(context),
            icon: const Icon(Icons.done_all, color: buttonContentColor,),
          ),
        ],
      ),
    );
  }
}
