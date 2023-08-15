import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:learn_flutter_paint/grid_painter.dart';

class ArcCurvePainterWidget extends StatelessWidget {
  const ArcCurvePainterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridPainterWidget(
      foregroundPainter: ArcCurvePainter(),
    );
  }
}

class ArcCurvePainter extends CustomPainter {
  final curvesPaint = Paint()
    ..strokeWidth = 5
    ..color = Colors.greenAccent[700]!
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    // Arc
    const arcCenter = Offset(200, 80);
    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
    final startAngle = degreesToRadians(10);
    final sweepAngle = degreesToRadians(-90);
    canvas.drawArc(arcRect, startAngle, sweepAngle, false, curvesPaint);

    // Quadratic Bézier
    final qCurve1 = Path()
      ..moveTo(50, 150)
      ..relativeQuadraticBezierTo(100, -100, 300, 0);
    canvas.drawPath(qCurve1, curvesPaint..color = Colors.deepPurpleAccent);

    final qCurve2 = Path()
      ..moveTo(0, 150)
      ..relativeQuadraticBezierTo(150, 300, 300, 100);
    canvas.drawPath(qCurve2, curvesPaint..color = Colors.blue);

    // Cubic Bezier
    final cCurve1 = Path()
      ..moveTo(0, 450)
      ..relativeCubicTo(50, -100, 250, -100, 300, 0);
    canvas.drawPath(cCurve1, curvesPaint..color = Colors.red);

    final cCurve2 = Path()
      ..moveTo(380, 300)
      ..relativeCubicTo(0, 450, -300, 300, -150, 250);
    canvas.drawPath(cCurve2, curvesPaint..color = Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double degreesToRadians(double degrees) {
    return (degrees * math.pi) / 180;
  }
}
