import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';


/// Widget with information for user about vertical and horizontal amounts
class InfoCellWidget extends StatelessWidget {
  const InfoCellWidget({Key? key, required this.horizontalValue, required this.verticalValue})
      : super(key: key);

  /// Sum of digits horizontally.
  final int horizontalValue;

  /// Sum of digits vertically.
  final int verticalValue;

  String getText() {
    var horizontal = horizontalValue == 0 ? ' ' : horizontalValue.toString();
    var vertical = verticalValue == 0 ? ' ' : verticalValue.toString();
    return vertical + '\\' + horizontal;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color?>(Colors.blue[800]),
            side: MaterialStateProperty.all<BorderSide>(const BorderSide(
              color: buttonColor,
              width: 1,
              style: BorderStyle.solid,
            )),
          ),
          child: Text(
            getText(),
            style: const TextStyle(fontSize: 12, color: buttonColor),
          )),
    );
  }
}
