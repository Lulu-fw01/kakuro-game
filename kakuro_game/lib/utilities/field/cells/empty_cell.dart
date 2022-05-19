import 'package:flutter/widgets.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell_widget.dart';

/// Empty cell. It is contains nothing.
class EmptyCell {

  EmptyCell();

  Widget getWidget() {
    return const EmptyCellWidget();
  }

  /// Convert cell into native format [String].
  ///   - [EmptyCell] into 'emp'.
  ///   - [InfoCell] into 'inf#verticalValue\horizontalValue' (example: inf#12\45).
  ///   - [InputCell] into 'inp#answerValue\actualValue' (example: inp#4\7)
  String get nativeString => 'emp';
}