import 'package:flutter/material.dart';
import 'package:kakuro_game/models/options_icons.dart';
import 'package:kakuro_game/providers/field_notifier.dart';
import 'package:kakuro_game/providers/stopwatch_notifier.dart';
import 'package:kakuro_game/screens/menu_screen/menu_screen.dart';
import 'package:kakuro_game/utilities/field/field.dart';
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

  void _changeStopwatchVisible(StopwatchNotifier notifier) {
    // Change visible of stopwatch.
    notifier.changeVisible();
  }

  void _showHint(Field field) {
    field.showHint();
  }

  void _showAnswer(Field field) {
    field.showAnswer();
  }

  @override
  Widget build(BuildContext context) {
    // Get notifier about stopwatch visible.
    final notifier = Provider.of<StopwatchNotifier>(context);

    final fieldNotifier = Provider.of<FieldNotifier>(context);

    final fieldWidth = fieldNotifier.field.width * 38.0;
    final fieldHeight = fieldNotifier.field.height * 38.0;

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          // Background color of the screen.
          backgroundColor: backgroundColor,
          // Place buttons in the center of screen.
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  alignment: Alignment.center,
                  //width: MediaQuery.of(context).size.width,
                  child: Center(child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: ClipRect(
                            child: InteractiveViewer(
                          //constrained: false,
                          boundaryMargin: EdgeInsets.only(
                            left: 38,
                            right: fieldWidth > constraints.maxWidth
                                ? (fieldWidth - constraints.maxWidth + 38)
                                : 38,
                            top: 38,
                            bottom: fieldHeight > constraints.maxHeight
                                ? (fieldHeight - constraints.maxHeight + 38)
                                : 38,
                          ),
                          minScale: 0.3,
                          maxScale: 2,
                          child: Center(
                              child: Wrap(
                            direction: Axis.vertical,
                            spacing: 1.5,
                            children: fieldNotifier.field.getRows(),
                          )),
                        )),
                      );
                    },
                  ))),
              const Padding(
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
                onPressed: () => _changeStopwatchVisible(notifier),
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
