import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/providers/stopwatch_notifier.dart';
import 'package:provider/provider.dart';

/// Stopwatch button that appears when 
/// [OptionsFloatingButton] was clicked.
/// 
/// This button should change stopwatch state.
class StopwatchButton extends StatelessWidget {
  const StopwatchButton(
      {Key? key,
      required this.onPressed,
      required this.onIcon,
      required this.offIcon})
      : super(key: key);

  final VoidCallback? onPressed;
  final Widget onIcon;
  final Widget offIcon;

  @override
  Widget build(BuildContext context) {
   
    return Consumer<StopwatchNotifier>(
      builder: (context, notifier, _) => Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: buttonColor,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: notifier.stopwatchVisible ? onIcon : offIcon,
      ),
    )
    );
  }
}
