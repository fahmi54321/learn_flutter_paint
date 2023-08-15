import 'package:flutter/material.dart';
import 'package:learn_flutter_paint/grid_painter.dart';
import 'package:learn_flutter_paint/oval_painter.dart';
import 'package:learn_flutter_paint/polygon_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GridPainterWidget(),
                  ),
                );
              },
              child: const Text('Grid painter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PolygonPainterWidget(),
                  ),
                );
              },
              child: const Text('Polygon painter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OvalPainterWidget(),
                  ),
                );
              },
              child: const Text('Oval painter'),
            ),
          ],
        ),
      ),
    );
  }
}
