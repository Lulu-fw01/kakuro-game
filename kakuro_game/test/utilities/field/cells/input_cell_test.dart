import 'package:kakuro_game/utilities/field/cells/input_cell.dart';
import 'package:test/test.dart';
import 'package:kakuro_game/utilities/field/field.dart';

void main() {
  group('Input Cell', () {

    test('Parse string into Cell', () {
      var cell = Field.cellFromString('inp#9');

      expect(cell is InputCell, true);

      expect((cell as InputCell).answerValue, 9);
      expect(cell.actualValue, 0);
    });

    test('Show answer', () {
      var cell = Field.cellFromString('inp#9');

      expect(cell is InputCell, true);

      (cell as InputCell).actualValue = cell.answerValue;
      expect(cell.actualValue, 9);
    });
  });
}