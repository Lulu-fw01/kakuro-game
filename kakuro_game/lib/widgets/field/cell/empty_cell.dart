import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyCell extends StatelessWidget {
  const EmptyCell({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 38,
        height: 38,
        child: DecoratedBox(
            decoration: BoxDecoration(
          color: Colors.black,
        )));
  }
}