import 'package:flutter/material.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell_widget.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell_widget.dart';
import 'package:kakuro_game/widgets/field/cell/value_cell_widget.dart';

class Field {
  

   Field();


  List<Row> getRows() {
    List<Row> rows = List<Row>.filled(5, Row());
    
    var row0 = Row(children: const [EmptyCellWidget(), EmptyCellWidget(), ValueCellWidget(verticalValue: 16), ValueCellWidget(verticalValue: 23), EmptyCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[0] = row0;

    var row1 = Row(children: const [EmptyCellWidget(), ValueCellWidget(verticalValue: 4, horizontalValue: 4), InputCellWidget(), InputCellWidget(), ValueCellWidget(verticalValue: 9)],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[1] = row1;

    var row2 = Row(children: const [ValueCellWidget(horizontalValue: 27), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[2] = row2;

    var row3 = Row(children: const [ValueCellWidget(horizontalValue: 10), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[3] = row3;

    var row4 = Row(children: const [EmptyCellWidget(), ValueCellWidget(horizontalValue: 11), InputCellWidget(), InputCellWidget(), EmptyCellWidget()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[4] = row4;

    return rows;
  }

}