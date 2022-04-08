import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/utilities/field/field.dart';
import 'package:kakuro_game/widgets/time/stopwatch.dart';


/// Screen with game field.
class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

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
      persistentFooterButtons: [
        IconButton(
          icon: const Icon(
            Icons.timer,
            color: buttonColor,
          ),
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(
            Icons.help,
            color: buttonColor,
          ),
          onPressed: () => {},
        ),
        IconButton(
            icon: const Icon(
              Icons.menu,
              color: buttonColor,
            ),
            onPressed: () => {/*showModalBottomSheet(context: context, builder: builder)*/})
      ],
    );
  }
}
