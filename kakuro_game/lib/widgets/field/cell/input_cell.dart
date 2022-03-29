import 'package:flutter/material.dart';


/// Cell where user can add value.
class InputCell extends StatefulWidget {
  const InputCell({Key? key}) : super(key: key);

  @override
  _InputCellState createState() => _InputCellState();
}

class _InputCellState extends State<InputCell> {

  int _value = 0;

  /// Value in cell that user has entered.
  int get value => _value;

  void _toggleFavorite() {
    setState(() {
      if (_value == 9) {
        _value = 1;
      } else {
        _value++;
      }
    });
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 38,
        height: 38,
        child: TextButton(
          onPressed: _toggleFavorite,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color?>(Colors.blue[800]),
            side: MaterialStateProperty.all<BorderSide>(const BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            )),
          ),
          child: Text(
            _value.toString(),
          )
          ),
        );
  }
}
