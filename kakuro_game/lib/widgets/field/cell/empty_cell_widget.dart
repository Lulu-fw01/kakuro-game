import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';

/// Empty widget if there are not input widget or value widget
class EmptyCellWidget extends StatelessWidget {
  const EmptyCellWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 38,
        height: 38,
        child: DecoratedBox(
            decoration: BoxDecoration(
          color: backgroundColor,
        )));
  }
}