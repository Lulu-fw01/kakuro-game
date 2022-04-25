import 'package:flutter/material.dart';
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

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
            return Dialog(
              backgroundColor: fourthColor.withOpacity(0.7),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () => {}, child: const Text("1")),
                    TextButton(onPressed: () => {}, child: const Text("2")),
                    TextButton(onPressed: () => {}, child: const Text("3"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () => {}, child: const Text("4")),
                    TextButton(onPressed: () => {}, child: const Text("5")),
                    TextButton(onPressed: () => {}, child: const Text("6"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () => {}, child: const Text("7")),
                    TextButton(onPressed: () => {}, child: const Text("8")),
                    TextButton(onPressed: () => {}, child: const Text("9"))
                  ],
                ),
              ],
            ),
          );
        });
    
    /*setState(() {
      if (_value == 9) {
        _value = 1;
      } else {
        _value++;
      }
    });*/
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
          )
          ),
        );
  }
}



/*

Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    TextButton(onPressed: () => {}, child: const Text("1")),
                    TextButton(onPressed: () => {}, child: const Text("2")),
                    TextButton(onPressed: () => {}, child: const Text("3"))
                  ],
                ),
                Row(
                  children: [
                    TextButton(onPressed: () => {}, child: const Text("4")),
                    TextButton(onPressed: () => {}, child: const Text("5")),
                    TextButton(onPressed: () => {}, child: const Text("6"))
                  ],
                ),
                Row(
                  children: [
                    TextButton(onPressed: () => {}, child: const Text("7")),
                    TextButton(onPressed: () => {}, child: const Text("8")),
                    TextButton(onPressed: () => {}, child: const Text("9"))
                  ],
                ),
              ],
            )
            */