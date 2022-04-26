
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell_widget.dart';

/// Class that describes cell, where user can change value.
class InputCell extends EmptyCell {

  int _actualValue = 0;

  ///Actual value in this cell.
  int get actualValue => _actualValue;

  /// Add 1 to value in this cell.
  /// (Maybe it is temporary method).
  void add() {
    _actualValue++;
    if (_actualValue >= 10) {
      _actualValue = 1;
    }
  }

  InputCell();

  @override
  Widget getWidget() {
    return const InputCellWidget();
  }
}