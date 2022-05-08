import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';
import 'package:kakuro_game/utilities/field/cells/input_cell.dart';

/// Cell where user can change value.
class InputCellWidget extends StatefulWidget {
  const InputCellWidget({Key? key, required this.cell}) : super(key: key);

  /// Cell of this widget.
  final InputCell cell;

  @override
  _InputCellState createState() => _InputCellState();
}

class _InputCellState extends State<InputCellWidget> {
  @override
  void initState() {
    super.initState();
    widget.cell.updateWidgetState = () => setState(() {});
  }

  void _changeValue(int newValue) {
    setState(() {
      widget.cell.actualValue = newValue;
    });
  }

  Widget _dialogButton({required int value, required BuildContext context}) =>
      TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color?>(buttonColor.withOpacity(0.8)),
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
            backgroundColor: MaterialStateProperty.all<Color?>(cellColor),
            side: MaterialStateProperty.all<BorderSide>(const BorderSide(
              color: buttonColor,
            )),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            )),
          ),
          child: Text(
            widget.cell.actualValue.toString(),
            style: const TextStyle(color: buttonContentColor),
          )),
    );
  }
}
