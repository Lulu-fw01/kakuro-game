import 'package:flutter/widgets.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell_widget.dart';

/// Empty cell. It is contains nothing.
class EmptyCell {

  EmptyCell();

  Widget getWidget() {
    return const EmptyCellWidget();
  }
}