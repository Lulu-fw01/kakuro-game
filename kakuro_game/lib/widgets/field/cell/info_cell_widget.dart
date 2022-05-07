
import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';


/// Widget with information for user about vertical and horizontal amounts.
class InfoCellWidget extends StatelessWidget {
  const InfoCellWidget({Key? key, required this.horizontalValue, required this.verticalValue})
      : super(key: key);

  /// Sum of digits horizontally.
  final int horizontalValue;

  /// Sum of digits vertically.
  final int verticalValue;

  Widget _sumText({required int sum}) => Text(
                      sum == 0 ? "" : sum.toString(),
                      style: const TextStyle(fontSize: 12, color: buttonColor),
                    );

  @override
  Widget build(BuildContext context) {
    final paddingVerticalVal = verticalValue > 9 ? 4.0 : 7.0; 
    final paddingHorizontalVal = horizontalValue > 9 ? 4.0 : 7.0;
    return SizedBox(
        width: 38,
        height: 38,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: buttonColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4.0))),
          child: Stack(children: [
            ClipPath(
              clipper: _LeftTriangleClipper(),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF2282E2),
                    borderRadius: BorderRadius.all((Radius.circular(3.0)))),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 4.0, left: paddingVerticalVal),
                        child: _sumText(sum: verticalValue))),
              ),
            ),
            ClipPath(
                clipper: _RightTriangleClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF1565C0),
                      borderRadius: BorderRadius.all((Radius.circular(3.0)))),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: paddingHorizontalVal, top: 4.0),
                          child: _sumText(sum: horizontalValue))),
                )),
          ]),
        ));
  }
}

class _LeftTriangleClipper extends CustomClipper<Path> {
  final radius = 1.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _RightTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false; 
}
