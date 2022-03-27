
import 'package:flutter/material.dart';
import 'package:kakuro_game/utilities/field/cell/empty_cell.dart';

class Field {
  
  List<List<EmptyCell>>? _field;

   Field(List<List<int>> input) {
     
   }

  // TODO Realize method which converts int matrix into list of rows.
  List<Row> getRows() {
    return new List.empty();
  }

}