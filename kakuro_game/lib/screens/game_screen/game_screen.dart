import 'package:flutter/material.dart';
import 'package:kakuro_game/models/options_icons.dart';
import 'package:kakuro_game/providers/field_controller.dart';
import 'package:kakuro_game/providers/stopwatch_controller.dart';
import 'package:kakuro_game/screens/menu_screen/menu_screen.dart';
import 'package:kakuro_game/utilities/field/field.dart';
import 'package:kakuro_game/widgets/field/field_widget.dart';
import 'package:kakuro_game/widgets/options_floating_button/option_button/stopwatch_button.dart';
import 'package:provider/provider.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/widgets/options_floating_button/option_button/option_button.dart';
import 'package:kakuro_game/widgets/options_floating_button/options_floating_button.dart';
import 'package:kakuro_game/widgets/time/game_stopwatch.dart';

/// Screen with game field.
class GameScreen extends StatelessWidget {
  /// Route of this screen
  static const routeName = "/game";

  const GameScreen({Key? key}) : super(key: key);

  void _toMenuScreen(BuildContext context) {
    Navigator.pushNamed(context, MenuScreen.routeName);
  }

  void _showHint(Field field) {
    field.showHint();
  }

  void _showAnswer(Field field) {
    field.showAnswer();
  }

  @override
  Widget build(BuildContext context) {
    final fieldNotifier = Provider.of<FieldController>(context);


    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          // Background color of the screen.
          backgroundColor: backgroundColor,
          // Place buttons in the center of screen.
          body: Stack(
            alignment: Alignment.topCenter,
            children: const [
              FieldWidget(),
              Padding(
                padding: EdgeInsets.all(56.0),
                child: GameStopwatch(),
              ),
            ],
          ),
          floatingActionButton: OptionsFab(
            distance: 112.0,
            children: [
              OptionButton(
                onPressed: () => _toMenuScreen(context),
                icon: const Icon(
                  Icons.home,
                  color: buttonContentColor,
                ),
              ),
              StopwatchButton(
                onPressed: () =>
                    Provider.of<StopwatchController>(context, listen: false)
                        .changeVisible(),
                onIcon: const Icon(
                  Icons.timer,
                  color: buttonContentColor,
                ),
                offIcon: const Icon(
                  Icons.timer_off,
                  color: buttonContentColor,
                ),
              ),
              OptionButton(
                onPressed: () => _showHint(fieldNotifier.field),
                icon: const Icon(
                  OptionsIcons.lamp,
                  color: buttonContentColor,
                ),
              ),
              OptionButton(
                onPressed: () => _showAnswer(fieldNotifier.field),
                icon: const Icon(
                  OptionsIcons.award,
                  color: buttonContentColor,
                ),
              ),
            ],
          ),
        ));
  }

  /// Disable android back button.
  Future<bool> _onWillPop() async {
    return false;
  }
}
