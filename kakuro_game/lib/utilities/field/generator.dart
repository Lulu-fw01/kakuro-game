
import 'dart:math';

import 'field.dart';

class Generator {
  
   Random _rnd = Random(DateTime.now().millisecondsSinceEpoch);

   late final int _width;
   late final int _height;
   late final int _difficulty;

   Generator(int width, int height, [int difficulty = 2]) {
     _width = width;
     _height = height;
     _difficulty = difficulty;
   }


   Field? _wField;

  /// Method for field generation.
   void generate() {
     _wField = Field(_width, _height, 5);

     
   }
}