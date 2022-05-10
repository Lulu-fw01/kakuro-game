import 'package:flutter/widgets.dart';

/// Notifier for [GameStopwatch].
class StopwatchController extends ChangeNotifier {
  bool _stopwatchVisible = true;

  /// Stopwatch visible.
  bool get stopwatchVisible => _stopwatchVisible;

  /// Change stopwatch visible to opposite.
  void changeVisible() {
    _stopwatchVisible = !_stopwatchVisible;
    notifyListeners();
  }
}
