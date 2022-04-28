import 'dart:math';

import 'package:kakuro_game/utilities/field/cells/info_cell.dart';
import 'package:kakuro_game/utilities/field/cells/input_cell.dart';
import 'package:test/test.dart';
import 'package:kakuro_game/utilities/field/field.dart';

void main() {
  test('Parse string into Cell', () {
    var cell = Field.cellFromString('inf#11\\10');

    expect(cell is InfoCell, true);

    expect((cell as InfoCell).horizontalValue, 10);

    expect(cell.verticalValue, 11);

    cell = Field.cellFromString('inp#9');
    expect(cell is InputCell, true);
    expect((cell as InputCell).answerValue, 9);
  });
}
