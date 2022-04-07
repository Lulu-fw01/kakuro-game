
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/widgets/time/time_card.dart';

// TODO rewrite timer to stopwatch

class Stopwatch extends StatefulWidget {
  final bool isOn;

  const Stopwatch({Key? key, this.isOn = true}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _StopwatchState();
  
}

class _StopwatchState extends State<Stopwatch> {

  static const countdownDuration = Duration(minutes: 10);
  Duration duration = const Duration();

  Timer? timer;
  bool countDown = true;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void reset(){
    if (countDown){
      setState(() =>
        duration = countdownDuration);
    } else{
      setState(() =>
        duration = const Duration());
    }
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}){
    if (resets){
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours =twoDigits(duration.inHours);
    final minutes =twoDigits(duration.inMinutes.remainder(60));
    final seconds =twoDigits(duration.inSeconds.remainder(60));

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