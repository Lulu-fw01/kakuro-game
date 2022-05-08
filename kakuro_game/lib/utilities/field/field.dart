import 'package:flutter/material.dart';
import 'package:kakuro_game/providers/ffi_bridge/ffi_bridge.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/utilities/field/cells/info_cell.dart';
import 'package:kakuro_game/utilities/field/cells/input_cell.dart';

/// Class that describes kakuro field.
class Field {
  /// Constructor.
  ///   - height - number of rows in field.
  ///   - width - number of columns in field.
  Field(int height, int width) {
    _width = width;
    _height = height;
    _cells = List.generate(_height, (index) => List.filled(_width, EmptyCell()),
        growable: false);
  }

  late final int _width;
  late final int _height;

  /// Is this kakuro field solved.
  bool solved = false;

  /// Width of field.
  int get width => _width;

  /// Height of field.
  int get height => _height;

  /// Cells of the field.
  late List<List<EmptyCell>> _cells;

  List<List<EmptyCell>> get cells => _cells;

  /// Make every [InputCell]'s actual value equal to answer.
  void showAnswer() {
    for (var row in _cells) {
      row.whereType<InputCell>().forEach((cell) {
        cell.actualValue = cell.answerValue;
        cell.updateWidgetState();
      });
    }
    solved = true;
  }

  /// This method set in random [InputCell] with incorrect answer correct answer.
  void showHint() {
    var wrongAnswers = <InputCell>[];

    for (var row in _cells) {
      wrongAnswers.addAll(row
          .whereType<InputCell>()
          .where((cell) => cell.actualValue != cell.answerValue)
          .toList());
    }
  }

  /// This method check if current cells values form a solution.
  bool checkSolution() {
    return false;
  }

  /// This method returns field as list of widgets.
  List<Wrap> getRows() {
    List<Wrap> cells = List<Wrap>.filled(height, Wrap());

    for (int i = 0; i < height; ++i) {
      cells[i] = Wrap(
        spacing: 1.5,
        children: _cells[i].map((e) => e.getWidget()).toList(),
      );
    }

    return cells;
  }

  /// Method for generating kakuro board.
  static Field getRandomField(int height, int width, int difficulty) {
    debugPrint('Start field generation.');
    String stringField =
        FFIBridge.generateKakuroBoard(height, width, difficulty);
    debugPrint("Field in string format : $stringField");
    return getFieldFromString(stringField, height, width);
  }

  /// This function parse [String] into [Field] object.
  static Field getFieldFromString(String stringField, int height, int width) {
    var newField = Field(height, width);

    var strCells = stringField.split(' ');
    debugPrint(
        'Parse field in string format. Number of cells in string: ${strCells.length}');
    int cellNum = 0;
    for (int i = 0; i < height; ++i) {
      for (int j = 0; j < width; ++j) {
        newField._cells[i][j] = cellFromString(strCells[cellNum]);
        cellNum++;
      }
    }

    debugPrint('Field was created');
    return newField;
  }

  /// This Function parse cell in [String] format into [EmptyCell], [InfoCell] or [InputCell].
  ///
  /// String formats:
  ///   - 'emp' for empty cell.
  ///   - 'inf#down\right' for info cell.
  ///       - example: inf#45\11.
  ///   - 'inp#val' for input cell.
  ///       - example: inp#9.
  static EmptyCell cellFromString(String strCell) {
    if (strCell == 'emp') {
      return EmptyCell();
    }
    var splitStr = strCell.split('#');
    String type = splitStr[0];
    String body = splitStr[1];
    switch (type) {
      case 'inf':
        var downRight = body.split('\\');
        int vVal = int.parse(downRight[0]);
        int hVal = int.parse(downRight[1]);
        return InfoCell(horizontalValue: hVal, verticalValue: vVal);
      case 'inp':
        int answer = int.parse(body);
        return InputCell(answerValue: answer);
      default:
        return EmptyCell();
    }
  }
}
