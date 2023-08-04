import 'package:flutter/material.dart';
import 'package:learn_flutter_paint/grid_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
