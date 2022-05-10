import 'package:flutter/widgets.dart';

import '../utilities/field/field.dart';

/// Notifier which provides access to kakuro board of the game.
class FieldController extends ChangeNotifier {
  late Field field;
}