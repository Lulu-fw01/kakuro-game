
import 'package:flutter/material.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell_widget.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell_widget.dart';
import 'package:kakuro_game/widgets/field/cell/info_cell_widget.dart';

/// Class that describes kakuro field.
class Field {

   late final int _width;
   late final int _height;

   Field(int width, int height) {
     _width = width;
     _height = height;
     _cells = List.generate(_height, (index) => List.filled(_width, EmptyCell()), growable: false);
   }
  
   /// Cells of the field.
   List<List<EmptyCell>>? _cells;

  List<Row> getRows() {
    List<Row> rows = List<Row>.filled(5, Row());
    
    var row0 = Row(children: const [EmptyCellWidget(), EmptyCellWidget(), InfoCellWidget(verticalValue: 16), InfoCellWidget(verticalValue: 23), EmptyCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[0] = row0;

    var row1 = Row(children: const [EmptyCellWidget(), InfoCellWidget(verticalValue: 4, horizontalValue: 4), InputCellWidget(), InputCellWidget(), InfoCellWidget(verticalValue: 9)],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[1] = row1;

    var row2 = Row(children: const [InfoCellWidget(horizontalValue: 27), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[2] = row2;

    var row3 = Row(children: const [InfoCellWidget(horizontalValue: 10), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[3] = row3;

    var row4 = Row(children: const [EmptyCellWidget(), InfoCellWidget(horizontalValue: 11), InputCellWidget(), InputCellWidget(), EmptyCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[4] = row4;

    return rows;
  }

}