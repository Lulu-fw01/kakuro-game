import 'package:kakuro_game/utilities/field/cells/info_cell.dart';
import 'package:kakuro_game/utilities/field/cells/input_cell.dart';
import 'package:test/test.dart';
import 'package:kakuro_game/utilities/field/field.dart';

void main() {
  group('Field', () {

    String getFieldInStringFormat() {
      return ('emp emp inf#0\\16 inf#23\\0 emp '
          'emp inf#4\\4 inp#9 inp#0 inf#9\\0 '
          'inf#0\\27 inp#0 inp#0 inp#0 inp#0 '
          'inf#0\\10 inp#0 inp#0 inp#0 inp#0 '
          'emp inf#0\\11 inp#0 inp#0 emp');
    }

    test('Parse string into Cell', () {
      var cell = Field.cellFromString('inf#11\\10');

      expect(cell is InfoCell, true);

      expect((cell as InfoCell).horizontalValue, 10);

      expect(cell.verticalValue, 11);

      cell = Field.cellFromString('inp#9');
      expect(cell is InputCell, true);
      expect((cell as InputCell).answerValue, 9);
    });

    test('Parse string into Field', () {
      String stringField = ('emp emp inf#0\\16 inf#23\\0 emp '
          'emp inf#4\\4 inp#9 inp#0 inf#9\\0 '
          'inf#0\\27 inp#0 inp#0 inp#0 inp#0 '
          'inf#0\\10 inp#0 inp#0 inp#0 inp#0 '
          'emp inf#0\\11 inp#0 inp#0 emp');

      var field = Field.getFieldFromString(stringField, 5, 5);

      var cells = field.cells;

      expect(cells[0][2] is InfoCell, true);
      expect((cells[0][2] as InfoCell).horizontalValue, 16);
      expect((cells[0][2] as InfoCell).verticalValue, 0);

      expect(cells[1][2] is InputCell, true);
      expect((cells[1][2] as InputCell).answerValue, 9);

      expect(cells[4][1] is InfoCell, true);
      expect((cells[4][1] as InfoCell).horizontalValue, 11);
      expect((cells[4][1] as InfoCell).verticalValue, 0);

    });

    test('Show answer', () {
      var strField = getFieldInStringFormat();
      var field = Field.getFieldFromString(strField, 5, 5);

      field.showAnswer();
      var cells = field.cells;
      expect(cells[1][2] is InputCell, true);
      expect((cells[1][2] as InputCell).actualValue, 9);

    });

  });
}
