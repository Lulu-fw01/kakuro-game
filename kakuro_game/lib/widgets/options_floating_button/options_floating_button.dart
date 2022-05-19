/// Idea of this button was taken from https://docs.flutter.dev/cookbook/effects/expandable-fab

import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';

import 'expanding_option_button.dart';

/// Expandable floating button.
///
/// It contains many options buttons
/// that ara visible when user click on this floating button.
@immutable
class OptionsFab extends StatefulWidget {
  // Immutable annotation says that
  // all fields in class should be final.

  const OptionsFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  /// In which state widget will be o start.
  final bool? initialOpen;

  /// Max distance to each element.
  final double distance;

  /// Widgets that will be shown when OptionsFab was clicked.
  final List<Widget> children;

  @override
  _OptionsFabState createState() => _OptionsFabState();
}

class _OptionsFabState extends State<OptionsFab>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin - thing for animation.
  // In this case we have animation when options buttons "swim" from OptionsFab widget.

  // Controller for playing animation.
  late final AnimationController _controller;
  // Set how animation going.
  late final Animation<double> _expandAnimation;
  // Just a flag of current state.
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingOptionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  List<Widget> _buildExpandingOptionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        ExpandingOptionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          color: fifthColor,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            backgroundColor: fourthColor,
            onPressed: _toggle,
            child: const Icon(
              Icons.menu,
              color: buttonContentColor,
            ),
          ),
        ),
      ),
    );
  }
}
