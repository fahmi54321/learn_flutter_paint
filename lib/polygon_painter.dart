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
      // ..style = PaintingStyle.fill;
      ..style = PaintingStyle.stroke;

    // triangle
    final triangle = Path()
      ..moveTo(150, 0)
      ..relativeLineTo(100, 100)
      ..relativeLineTo(-150, 0)
      ..close();
    canvas.drawPath(triangle, paint);

    // square
    final square1 = Path()
      ..moveTo(50, 150)
      ..relativeLineTo(100, 0)
      ..relativeLineTo(0, 100)
      ..relativeLineTo(-100, 0)
      ..close();
    canvas.drawPath(square1, paint);

    // square 2
    const square2 = Rect.fromLTWH(200, 250, 100, 100);
    canvas.drawRect(square2, paint);

    // hexagon
    final hexagon = Path()
      ..moveTo(175, 350)
      ..relativeLineTo(75, 50)
      ..relativeLineTo(0, 75)
      ..relativeLineTo(-75, 50)
      ..relativeLineTo(-75, -50)
      ..relativeLineTo(0, -75)
      ..close();
    canvas.drawPath(hexagon, paint);

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
    canvas.drawPath(cross, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
