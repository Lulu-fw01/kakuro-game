import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cell/empty_cell.dart';

class InputCell extends EmptyCell {

  int? _value;

  /// Value in cell that user has entered.
  int? get value => _value;

  @override
  Widget getCell() {
    return Container();
  }
}