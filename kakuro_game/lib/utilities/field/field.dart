
import 'package:flutter/material.dart';
import 'package:kakuro_game/utilities/field/cells/empty_cell.dart';
import 'package:kakuro_game/utilities/field/cells/info_cell.dart';
import 'package:kakuro_game/widgets/field/cell/empty_cell_widget.dart';
import 'package:kakuro_game/widgets/field/cell/input_cell_widget.dart';
import 'package:kakuro_game/widgets/field/cell/info_cell_widget.dart';

/// Class that describes kakuro field.
class Field {

  final double _cellsSpace = 1.5;

   late final int _width;
   late final int _height;

   /// Width of field.
   int get width => _width;

   /// Height of field.
   int get height => _height;

   Field(int width, int height, int difficulty) {
     _width = width;
     _height = height;
     _cells = List.generate(_height, (index) => List.filled(_width, EmptyCell()), growable: false);

   }
  
  /// Cells of the field.
  late List<List<EmptyCell>> _cells;

  List<Widget> getRows() {

    // TODO test it.
    /*List<Wrap> cells = List<Wrap>.filled(height, Wrap());

    for (int i = 0; i < height; ++i) {
      cells[i] = Wrap(children: _cells[i].map((e) => e.getWidget()).toList(),);
    }*/


    List<Wrap> cells = List<Wrap>.filled(5, Wrap());
    
    var row0 = Wrap(children: const [EmptyCellWidget(), EmptyCellWidget(), InfoCellWidget(horizontalValue: 0, verticalValue: 16), InfoCellWidget(horizontalValue: 0, verticalValue: 23), EmptyCellWidget()],
    spacing: _cellsSpace,);
    cells[0] = row0;

    var row1 = Wrap(children: const [EmptyCellWidget(), InfoCellWidget(verticalValue: 4, horizontalValue: 4), InputCellWidget(), InputCellWidget(), InfoCellWidget(horizontalValue: 0, verticalValue: 9)],
    spacing: _cellsSpace);
    cells[1] = row1;

    var row2 = Wrap(children: const [InfoCellWidget(horizontalValue: 27, verticalValue: 0,), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget()],
    spacing: _cellsSpace);
    cells[2] = row2;

    var row3 = Wrap(children: const [InfoCellWidget(horizontalValue: 10, verticalValue: 0,), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget()],
    spacing: _cellsSpace);
    cells[3] = row3;

    var row4 = Wrap(children: const [EmptyCellWidget(), InfoCellWidget(horizontalValue: 11, verticalValue: 0,), InputCellWidget(), InputCellWidget(), EmptyCellWidget()],
    spacing: _cellsSpace);
    cells[4] = row4;

    /*var cells = [EmptyCellWidget(), EmptyCellWidget(), InfoCellWidget(verticalValue: 16), InfoCellWidget(verticalValue: 23), EmptyCellWidget(),
    EmptyCellWidget(), InfoCellWidget(verticalValue: 4, horizontalValue: 4), InputCellWidget(), InputCellWidget(), InfoCellWidget(verticalValue: 9),
    InfoCellWidget(horizontalValue: 27), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget(),
    InfoCellWidget(horizontalValue: 10), InputCellWidget(), InputCellWidget(), InputCellWidget(), InputCellWidget(),
    ];*/
    
    return cells;
  }

  /// Method for generating kakuro board.
  static Field fieldFromString(int _width, int _height, int difficulty) {
    var newField = Field(_width, _height, difficulty);

    // emp inf#4|5 inp#6

    return newField;
  }

}