import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cell/empty_cell.dart';

class ValueCell extends EmptyCell {

  int? _horizontalValue;
  int? _verticalValue;

  /// Sum of digits horizontally. 
  int? get horizontalValue => _horizontalValue;

  /// Sum of digits vertically.
  int? get verticalValue => _verticalValue;

  @override
  Widget getCell() {
    return Container();
  }
}
