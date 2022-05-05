
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell_widget.dart';

/// Class that describes cell, where user can change value.
class InputCell extends EmptyCell {

  /// Actual value in this cell.
  int actualValue = 0;

  /// Possible answer for this value.
  final int answerValue;

  /// Return true if  value in this cell is equal to answer value.
  bool isRightActual() => actualValue == answerValue;

  InputCell({required this.answerValue}) {
    updateWidgetState = () => {};
  }

  /// This function should call method of widget, that will update state.
  late VoidCallback updateWidgetState;

  @override
  Widget getWidget() {
    return InputCellWidget(cell: this,);
  }
}