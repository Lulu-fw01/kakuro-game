
import 'package:flutter/material.dart';


/// Class whcih describes app properties
/// such as colors of buttons and screens.
class AppProperties {


  static String homeRoute = "/home";

  static String gameRoute = "/game";

  // Color of buttons.
  static Color? _buttonColor = Colors.pink[200];

  // Background color of screen.
  static Color? _backgroundColor = Colors.blue[700];

  static Color? _appBarColor = Colors.blue[800];

  /// Buttons color.
  static Color? get buttonColor => _buttonColor;

  /// Background color of the app.
  static Color? get backgroundColor => _backgroundColor;

  /// App bar color.
  static Color? get appBarColor => _appBarColor;

  /// Timer state.
  /// 
  /// True if on, flase if off.
  static bool timerState = false;
   

  static void setProperties() {
    _buttonColor = Colors.black;
    _backgroundColor = Colors.white;
      
    }
}
