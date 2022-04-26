import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kakuro_game/assets/consts.dart';


/// Cell where user can add value.
class InputCellWidget extends StatefulWidget {
  const InputCellWidget({Key? key}) : super(key: key);

  @override
  _InputCellState createState() => _InputCellState();
}

class _InputCellState extends State<InputCellWidget> {

  int _value = 0;

  /// Value in cell that user has entered.
  int get value => _value;

  void _changeValue(int newValue) {
    if (_value != newValue) {
      setState(() {
        _value = newValue;
      });
    }
  }

  Widget _dialogButton({required int value, required BuildContext context}) =>
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(buttonColor.withOpacity(0.8)),
        ),
        onPressed: () => {_changeValue(value), Navigator.of(context).pop()},
        child: Text(
          value.toString(),
          style: const TextStyle(color: buttonContentColor),
        ),
      );

  Widget _dialogLine(
          {required int val1,
          required int val2,
          required int val3,
          required BuildContext context}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _dialogButton(value: val1, context: context),
          _dialogButton(value: val2, context: context),
          _dialogButton(value: val3, context: context)
        ],
      );

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
            return Dialog(
              backgroundColor: fourthColor.withOpacity(0.3),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogLine(val1: 1, val2: 2, val3: 3, context: context),
                _dialogLine(val1: 4, val2: 5, val3: 6, context: context),
                _dialogLine(val1: 7, val2: 8, val3: 9, context: context),
              ],
            ),
          );
        });
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: TextButton(
          onPressed: _showDialog,
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
            _value.toString(),
            style: const TextStyle(color: buttonContentColor),
          )),
    );
  }
}
