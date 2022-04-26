
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/info_cell_widget.dart';

/// Info cell. Cell with information about horizontal and vertical sum.
class InfoCell extends EmptyCell {

  /// Sum of digits horizontally.
  final int horizontalValue;

  /// Sum of digits vertically.
  final int verticalValue;

  InfoCell({required this.horizontalValue, required this.verticalValue});

  @override
  Widget getWidget() {
    return InfoCellWidget(horizontalValue: horizontalValue, verticalValue: verticalValue);
  }
}
