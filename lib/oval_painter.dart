import 'package:flutter/material.dart';
import 'package:learn_flutter_paint/grid_painter.dart';

class OvalPainterWidget extends StatelessWidget {
  const OvalPainterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridPainterWidget(
      foregroundPainter: OvalPainter(),
    );
  }
}

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke;

    // Circle
    const circleRadius = 75.0;
    const circleCenter = Offset(200, 150);
    canvas.drawCircle(circleCenter, circleRadius, paint);

    // Oval
    const ovalCenter = Offset(200, 275);
    final oval = Rect.fromCenter(center: ovalCenter, width: 250, height: 100);
    canvas.drawOval(oval, paint);

    // Concentric circles
    var concentricCircleRadius = 100.0;
    const center = Offset(200, 500);
    while (concentricCircleRadius > 0) {
      canvas.drawCircle(center, concentricCircleRadius, paint);
      concentricCircleRadius -= 20;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
