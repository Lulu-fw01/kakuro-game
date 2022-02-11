
import 'package:flutter/material.dart';


/// Class whcih describes app properties
/// such as colors of buttons and screens.
class AppProperties {

  // Color of buttons.
  static Color? _buttonColor = Colors.pink[200];

  // Background color of screen.
  static Color? _backgroundColor = Colors.blue[700];

  /// Buttons color.
  static Color? get buttonColor => _buttonColor;

  /// Background color of the app.
  static Color? get backgroundColor => _backgroundColor;

  /// Timer state.
  /// 
  /// True if on, flase if off.
  static bool timerState = false;
   

  static void setProperties() {
    _buttonColor = Colors.black;
    _backgroundColor = Colors.white;
      
    }
}
