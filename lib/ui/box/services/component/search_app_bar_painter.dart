import 'package:flutter/material.dart';

class SearchAppBarPainter extends CustomPainter {
  SearchAppBarPainter({
    required this.context,
    required this.containerHeight,
    required this.center,
    required this.radius,
    required this.color,
  }) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  final Offset center;
  final double radius;
  final double containerHeight;
  final BuildContext context;

  final Color color;
  late double statusBarHeight;
  late double screenWidth;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..drawPath(
        Path()
          ..addRect(
            Rect.fromPoints(
              Offset.zero,
              Offset(size.width, size.height),
            ),
          )
          ..addRect(
            Rect.fromPoints(
              Offset.zero,
              Offset(size.width, size.height),
            ),
          )
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(3)),
      )
      ..clipRect(
        Rect.fromLTWH(0, 0, screenWidth, containerHeight + statusBarHeight),
      );

    final circlePainter = Paint()..color = color;
    canvas.drawCircle(center, radius, circlePainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
