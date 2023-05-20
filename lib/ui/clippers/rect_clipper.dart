import 'package:flutter/rendering.dart';

class RectClipper extends CustomClipper<Path> {
  final bool left;
  final bool right;

  RectClipper({this.left = false, this.right = false});
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(right ? 30 : 0, 0);
    path.lineTo(right ? 30 : 0, 0);
    path.lineTo(
      size.width - (left ? 30 : 0),
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
