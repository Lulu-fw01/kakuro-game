import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/field_controller.dart';

/// Field widget.
/// This widget contains [InteractiveViewer] filled with kakuro cells.
class FieldWidget extends StatelessWidget {
  const FieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldNotifier = Provider.of<FieldController>(context);

    final fieldWidth = fieldNotifier.field.width * 38.0 +
        1.5 * (fieldNotifier.field.width - 1);
    final fieldHeight = fieldNotifier.field.height * 38.0 +
        1.5 * (fieldNotifier.field.height - 1);

    return Center(
        child: InteractiveViewer(
            boundaryMargin: EdgeInsets.only(
              left: fieldWidth > MediaQuery.of(context).size.width ? 5 : 0,
              right: fieldWidth > MediaQuery.of(context).size.width ? 5 : 0,
              top: fieldHeight > 0.8 * MediaQuery.of(context).size.height
                  ? 100
                  : 0,
              bottom: fieldHeight > 0.8 * MediaQuery.of(context).size.height
                  ? (fieldHeight -
                      0.8 * MediaQuery.of(context).size.height +
                      38)
                  : 5,
            ),
            constrained: false,
            minScale: 0.3,
            maxScale: 2,
            child: SizedBox(
                width: max(MediaQuery.of(context).size.width, fieldWidth),
                height: max(MediaQuery.of(context).size.height, fieldHeight),
                child: Center(
                    child: Wrap(
                  direction: Axis.vertical,
                  spacing: 1.5,
                  children: fieldNotifier.field.getRows(),
                )))));
  }
}
