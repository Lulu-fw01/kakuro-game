
import 'package:flutter/widgets.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';

/// Info cell. Cell with information about horizontal and vertical sum.
class InfoCell extends EmptyCell {

  /// Sum of digits horizontally.
  //final int? horizontalValue;

  /// Sum of digits vertically.
  //final int? verticalValue;

  InfoCell();

  @override
  Widget getWidget() {
    // TODO add correct widget to return.
    return Container();
  }
}
