import 'package:flutter/material.dart';

class GridPainterWidget extends StatelessWidget {
  final CustomPainter? foregroundPainter;
  const GridPainterWidget({
    Key? key,
    this.foregroundPainter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CustomPaint(
          foregroundPainter: foregroundPainter,
          painter: GridPainter(),
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final double boxSize = 50;

  @override
  void paint(Canvas canvas, Size size) {
    final vLines = (size.width ~/ boxSize) + 1;
    final hLines = (size.height ~/ boxSize) + 1;

    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Draw vertical lines
    for (var i = 0; i < vLines; i++) {
      final x = boxSize * i;
      path.moveTo(x, 0);
      path.relativeLineTo(0, size.height);
    }

    // Draw horizontal lines
    for (var i = 0; i < hLines; i++) {
      final y = boxSize * i;
      path.moveTo(0, y);
      path.relativeLineTo(size.width, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
