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

/// Extension for animation controller.
/// Animation wll work n times and then stop.
/// After animation onCompleted function will be called.
extension on AnimationController {
  void repeatEx({required int times, VoidCallback? onCompleted}) {
    var count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (++count < times) {
          reverse();
        } else {
          count = 0;
          onCompleted!();
        }
      } else if (status == AnimationStatus.dismissed) {
        forward();
      }
    });
  }
}

class _InputCellState extends State<InputCellWidget>
    with TickerProviderStateMixin {
  late AnimationController _hintAnimationController;
  late bool _showingHint;

  @override
  void initState() {
    super.initState();
    _showingHint = false;
    // Create animation controller.
    // Set our extension: repeat 5 times and as onCompeted method set new state for our widget.
    _hintAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..repeatEx(
          times: 5,
          onCompleted: () => setState(() {
                _showingHint = false;
              }));

    widget.cell.showHintAnimation = () {
      setState(() {
        _hintAnimationController.reset();
        _hintAnimationController.forward();
        _showingHint = true;
      });
    };

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
            backgroundColor: backgroundColor.withOpacity(0.3),
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
          child: _cellText()),
    );
  }

  /// Widget that describes test of cell:
  /// If user asked about hint he will see text with animation.
  Widget _cellText() => _showingHint
      ? FadeTransition(
          opacity: _hintAnimationController,
          child: Text(
            widget.cell.actualValue.toString(),
            style: const TextStyle(color: Color(0xFFFDE71E)),
          ),
        )
      : Text(
          widget.cell.actualValue.toString(),
          style: const TextStyle(color: buttonContentColor),
        );

  @override
  void dispose() {
    _hintAnimationController.dispose();
    super.dispose();
  }
}
