
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell_widget.dart';

/// Class that describes cell, where user can change value.
class InputCell extends EmptyCell {

  int _actualValue = 0;

  ///Actual value in this cell.
  int get actualValue => _actualValue;

  final int answerValue;

  InputCell({required this.answerValue});

  @override
  Widget getWidget() {
    return const InputCellWidget();
  }
}