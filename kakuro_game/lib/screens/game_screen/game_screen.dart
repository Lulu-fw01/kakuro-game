import 'package:flutter/material.dart';
import 'package:kakuro_game/models/field_settings/field_settings.dart';
import 'package:kakuro_game/models/options_icons.dart';
import 'package:kakuro_game/providers/stopwatch_notifier.dart';
import 'package:kakuro_game/screens/menu_screen/menu_screen.dart';
import 'package:kakuro_game/widgets/options_floating_button/option_button/stopwatch_button.dart';
import 'package:provider/provider.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/utilities/field/field.dart';
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

  void _showHint(BuildContext context) {}

  void _showAnswer(BuildContext context) {}

  @override
  Widget build(BuildContext context) {

    // Get information about field from the route.
    final settings = ModalRoute.of(context)!.settings.arguments as FieldSettings;

    var field = Field.getRandomField(settings.height, settings.width, settings.difficulty);

    // Get notifier about stopwatch visible.
    final notifier = Provider.of<StopwatchNotifier>(context);
    
    return Scaffold(
      // Background color of the screen.
      backgroundColor: backgroundColor,
      // Place buttons in the center of screen.
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Center(child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: ClipRect(
                        child: InteractiveViewer(
                      minScale: 0.7,
                      maxScale: 2,
                      child: Center(
                          child: Wrap(
                        direction: Axis.vertical,
                        spacing: 1.5,
                        children: field.getRows(),
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
            onPressed: () => _showHint(context),
            icon: const Icon(
              OptionsIcons.lamp,
              color: buttonContentColor,
            ),
          ),
          OptionButton(
            onPressed: () => _showAnswer(context),
            icon: const Icon(
              OptionsIcons.award,
              color: buttonContentColor,
            ),
          ),
        ],
      ),
    );
  }
}
