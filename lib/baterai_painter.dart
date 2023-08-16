import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:learn_flutter_paint/grid_painter.dart';

class BateraiWidget extends StatelessWidget {
  const BateraiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridPainterWidget(
      foregroundPainter: BateraiPainter(),
    );
  }
}

class BateraiPainter extends CustomPainter {
  final margin = 30.0; // The space between the battery and the parent widget
  final padding = 10.0; // The space between the charge & pin and the border
  final pinWidth = 22.0; // The width of the pin

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    final pinPaint = Paint()
      ..color = Colors.white
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    final chargePaint = Paint()
      ..color = Colors.greenAccent[700]!
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    // Baterai border
    final border = borderBaterai(size);
    canvas.drawRRect(border, borderPaint);

    // Pin baterai
    final pin = pinBaterai(border);
    canvas.drawArc(pin, math.pi / 2, -math.pi, true, pinPaint);

    // isi baterai
    final isiBaterai = bgBaterai(border);
    canvas.drawRRect(isiBaterai, chargePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  RRect borderBaterai(Size size) {
    // 1
    final symmetricalMargin = margin * 2;
    // 2
    final width = size.width - symmetricalMargin - padding - pinWidth;
    // 3
    final height = width / 2;
    // 4
    final top = (size.height / 2) - (height / 2);
    // 5
    final radius = Radius.circular(height * 0.2);
    // 6
    final bounds = Rect.fromLTWH(margin, top, width, height);
    // 7
    return RRect.fromRectAndRadius(bounds, radius);
  }

  Rect pinBaterai(RRect border) {
    // 1
    final center = Offset(
      border.right + padding,
      border.top + (border.height / 2.0),
    );
    // 2
    final height = border.height * 0.38;
    // 3
    final width = pinWidth * 2;
    // 4
    return Rect.fromCenter(center: center, width: width, height: height);
  }

  RRect bgBaterai(RRect bdr) {
    final left = bdr.left + padding;
    final top = bdr.top + padding;
    final right = bdr.right - padding;
    final bottom = bdr.bottom - padding;
    final height = bottom - top;
    final width = right - left;
    final radius = Radius.circular(height * 0.15);
    final rect = Rect.fromLTWH(left, top, width, height);
    return RRect.fromRectAndRadius(rect, radius);
  }
}
