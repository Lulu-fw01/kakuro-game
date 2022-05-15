import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
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
        if (cell.actualValue != cell.answerValue) {
          cell.actualValue = cell.answerValue;
          cell.updateWidgetState();
        }
      });
    }
    solved = true;
  }

  List<InputCell> findWrongAnswers() {
    var wrongAnswers = <InputCell>[];

    for (var row in _cells) {
      wrongAnswers.addAll(row
          .whereType<InputCell>()
          .where((cell) => cell.actualValue != cell.answerValue)
          .toList());
    }

    return wrongAnswers;
  }

  /// This method set in random [InputCell] with incorrect answer correct answer.
  void showHint() {
    var wrongAnswers = findWrongAnswers();

    if (wrongAnswers.isEmpty) {
      return;
    }
    var rnd = Random();
    int ind = rnd.nextInt(wrongAnswers.length);
    wrongAnswers[ind].actualValue = wrongAnswers[ind].answerValue;
    wrongAnswers[ind].showHintAnimation();
  }

  /// This method check if current cells values form a solution.
  bool checkSolution() {
    return false;
  }

  String toNativeFormat() {
    String board = "";
    for (var row in _cells) {
      for (var cell in row) {
        board += cell.nativeString + ' ';
      }
    }

    return board.substring(0, board.length - 1);
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
    String stringField = generateKakuroBoard(height, width, difficulty);
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



  /// C++ library.
  static final DynamicLibrary _nativeApiLib = Platform.isAndroid
      ? DynamicLibrary.open('libkakuro_native_api.so')
      : DynamicLibrary.process();

  /// Native function for generating field.
  static final Pointer<Utf8> Function(int height, int width, int difficulty)
      _generateBoard = _nativeApiLib
          .lookup<NativeFunction<Pointer<Utf8> Function(Int32, Int32, Int32)>>(
              'generateBoard')
          .asFunction();

  /// Native function for checking solution.
  static final bool Function(int height, int width, Pointer<Utf8> board)
      _checkSolution = _nativeApiLib
          .lookup<NativeFunction<Bool Function(Int32, Int32, Pointer<Utf8>)>>(
              'checkSolution')
          .asFunction();

  /// This function calls function from native C++ library.
  static String generateKakuroBoard(int height, int width, int difficulty) {
    debugPrint('Calling native function for generating field.');
    Pointer<Utf8> cStrBoard = _generateBoard(height, width, difficulty);
    debugPrint('Got string from native function.');
    return cStrBoard.toDartString();
  }
}
