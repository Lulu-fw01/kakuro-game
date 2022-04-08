
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/widgets/time/time_card.dart';

/// Stopwatch widget.
class Stopwatch extends StatefulWidget {

  const Stopwatch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StopwatchState();
  
}

class _StopwatchState extends State<Stopwatch> {
  Duration duration = const Duration();

  Timer? timer;
  bool countDown = true;

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

  void stopTimer(){
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      timeCard(time: hours, header: "HOURS"),
      const SizedBox(
        width: 4,
      ),
      timeCard(time: minutes, header: 'MINUTES'),
      const SizedBox(
        width: 4,
      ),
      timeCard(time: seconds, header: 'SECONDS'),
    ]);
  }
}