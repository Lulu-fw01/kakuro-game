
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell.dart';
import 'package:kakuro_game/widgets/field/cell/value_cell.dart';

class Field {
  

   Field();


  List<Row> getRows() {
    List<Row> rows = List<Row>.filled(5, Row());
    
    var row0 = Row(children: const [EmptyCell(), EmptyCell(), ValueCell(verticalValue: 16), ValueCell(verticalValue: 23), EmptyCell()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[0] = row0;

    var row1 = Row(children: const [EmptyCell(), ValueCell(verticalValue: 4, horizontalValue: 4), InputCell(), InputCell(), ValueCell(verticalValue: 9)],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[1] = row1;

    var row2 = Row(children: const [ValueCell(horizontalValue: 27), InputCell(), InputCell(), InputCell(), InputCell()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[2] = row2;

    var row3 = Row(children: const [ValueCell(horizontalValue: 10), InputCell(), InputCell(), InputCell(), InputCell()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[3] = row3;

    var row4 = Row(children: const [EmptyCell(), ValueCell(horizontalValue: 11), InputCell(), InputCell(), EmptyCell()],
    mainAxisAlignment: MainAxisAlignment.center);
    rows[4] = row4;

    return rows;
  }

}