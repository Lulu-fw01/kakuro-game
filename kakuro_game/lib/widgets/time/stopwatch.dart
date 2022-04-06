
import 'dart:async';

import 'package:flutter/widgets.dart';

class Stopwatch extends StatefulWidget {
  final bool isOn;

  const Stopwatch({Key? key, this.isOn = true}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _StopwatchState();
  
}

class _StopwatchState extends State<Stopwatch> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}