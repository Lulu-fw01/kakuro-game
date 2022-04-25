
import 'package:flutter/widgets.dart';

/// Notifier for [GameStopwatch].
class StopwatchNotifier extends ChangeNotifier {
  bool _stopwatchVisible = true;

  /// Stopwatch visible.
  bool get stopwatchVisible => _stopwatchVisible;

  /// Set stopwatch visible.
  set stopwatchVisible(bool newVisible) {
    if (_stopwatchVisible != newVisible) {
      _stopwatchVisible = newVisible;
      notifyListeners();
    } 
  }

  /// Change stopwatch visible to opposite.
  void changeVisible() {
    _stopwatchVisible = !_stopwatchVisible;
    notifyListeners();
  }
}