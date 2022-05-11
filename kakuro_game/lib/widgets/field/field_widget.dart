import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/field_controller.dart';

class FieldWidget extends StatefulWidget {
  const FieldWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  @override
  Widget build(BuildContext context) {
    final fieldNotifier = Provider.of<FieldController>(context);

    final fieldWidth = fieldNotifier.field.width * 38.0 + 1.5 * (fieldNotifier.field.width - 1);
    final fieldHeight = fieldNotifier.field.height * 38.0 + 1.5 * (fieldNotifier.field.height - 1);

    return Container(
        alignment: Alignment.center,

        child: Center(child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height:  constraints.maxHeight,
              child: ClipRect(
                  child: InteractiveViewer(
                boundaryMargin: EdgeInsets.only(
                  left: fieldWidth > constraints.maxWidth ? 5 : 0,
                  right: fieldWidth > constraints.maxWidth
                      ? (fieldWidth - constraints.maxWidth + 5)
                      : 0,
                  top: fieldHeight > 0.8 * constraints.maxHeight ? 100 : 0,
                  bottom: fieldHeight > 0.8 * constraints.maxHeight
                      ? (fieldHeight - 0.8 * constraints.maxHeight + 38)
                      : 5,
                ),
                minScale: 0.3,
                maxScale: 2,
                child: Center(
                    child: Wrap(
                  direction: Axis.vertical,
                  spacing: 1.5,
                  children: fieldNotifier.field.getRows(),
                )),
              )),
            );
          },
        )));
  }
}
