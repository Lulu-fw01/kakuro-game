import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';

/// Option button that appears when 
/// [OptionsFloatingButton] was clicked.
@immutable
class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: buttonColor,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}