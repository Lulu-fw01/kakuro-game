import 'package:flutter/material.dart';

/// Empty widget if there are not input widget or value widget.
class EmptyCellWidget extends StatelessWidget {
  const EmptyCellWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 38,
      height: 38,
    );
  }
}
