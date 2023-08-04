import 'package:flutter/material.dart';
import 'package:learn_flutter_paint/grid_painter.dart';

class PolygonPainterWidget extends StatelessWidget {
  const PolygonPainterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridPainterWidget(
      foregroundPainter: PolygonPainter(),
    );
  }
}

class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.fill;

    // triangle
    final triangle = Path()
      ..moveTo(150, 0)
      ..relativeLineTo(100, 100)
      ..relativeLineTo(-150, 0)
      ..close();

    // square
    final square1 = Path();
    square1.moveTo(50, 150);
    square1.relativeLineTo(100, 0);
    square1.relativeLineTo(0, 100);
    square1.relativeLineTo(-100, 0);
    square1.close();

    // square 2
    const square2 = Rect.fromLTWH(200, 250, 100, 100);

    // hexagon
    final hexagon = Path()
      ..moveTo(175, 350)
      ..relativeLineTo(75, 50)
      ..relativeLineTo(0, 75)
      ..relativeLineTo(-75, 50)
      ..relativeLineTo(-75, -50)
      ..relativeLineTo(0, -75)
      ..close();

    // Cross
    final cross = Path()
      ..moveTo(150, 550)
      ..relativeLineTo(50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, -50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, -50)
      ..relativeLineTo(50, 0)
      ..close();

    canvas.drawPath(triangle, paint);
    canvas.drawPath(square1, paint);
    canvas.drawRect(square2, paint);
    canvas.drawPath(hexagon, paint);
    canvas.drawPath(cross, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
