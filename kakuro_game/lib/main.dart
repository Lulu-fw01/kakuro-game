import 'package:flutter/material.dart';
import 'package:kakuro_game/providers/field_notifier.dart';
import 'package:kakuro_game/screens/game_screen/game_screen.dart';
import 'package:kakuro_game/screens/menu_screen/menu_screen.dart';
import 'package:provider/provider.dart';

import 'providers/stopwatch_controller.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StopwatchController()),
        ChangeNotifierProvider(create: (context) => FieldNotifier())
      ],
      child: MaterialApp(
        initialRoute: MenuScreen.routeName,
        routes: {
          MenuScreen.routeName: (context) => const MenuScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
        },
      )));
}
