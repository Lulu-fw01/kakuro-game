import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/providers/stopwatch_controller.dart';
import 'package:kakuro_game/widgets/time/time_card.dart';
import 'package:provider/provider.dart';

/// Stopwatch widget.
class GameStopwatch extends StatefulWidget {
  const GameStopwatch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameStopwatchState();
}

class _GameStopwatchState extends State<GameStopwatch> {
  Duration duration = const Duration();

  Timer? timer;
  bool countDown = true;

  /// Visible property.
  bool visible = true;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    setState(() {
      final seconds = duration.inSeconds + 1;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void stopTimer() {
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Consumer<StopwatchController>(
        builder: (context, notifier, _) => Visibility(
            visible: notifier.stopwatchVisible,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              timeCard(time: hours),
              const SizedBox(
                width: 4,
              ),
              timeCard(time: minutes),
              const SizedBox(
                width: 4,
              ),
              timeCard(time: seconds),
            ])));
  }
}
