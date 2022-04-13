
import 'package:flutter/widgets.dart';

class StopwatchNotifier extends ChangeNotifier {
  bool _stopwatchVisible = true;

  bool get stopwatchVisible => _stopwatchVisible;

  set stopwatchVisible(bool newVisible) {
    if (_stopwatchVisible != newVisible) {
      _stopwatchVisible = newVisible;
      notifyListeners();
    } 
  }

  void changeVisible() {
    _stopwatchVisible = !_stopwatchVisible;
    notifyListeners();
  }
}