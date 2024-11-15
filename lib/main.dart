import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

enum BoxPos {
    left,
    center,
    right
}
class SquareAnimationState extends State<SquareAnimation> {
  static const _squareSize = 50.0;
  BoxPos _boxPos = BoxPos.center;
  bool _animating = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AnimatedAlign(
                alignment: switch (_boxPos) {
                  BoxPos.center => Alignment.center,
                  BoxPos.left => Alignment.centerLeft,
                  BoxPos.right => Alignment.centerRight,
                },
                duration: const Duration(seconds: 1),
                onEnd: () => setState(() => _animating = false),
                child: Container(
                  width: _squareSize,
                  height: _squareSize,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: _animating || _boxPos == BoxPos.left ? null : 
                () => setState(() {
                  _boxPos = BoxPos.left;
                  _animating = true;
                }),
              child: const Text('Right'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _animating || _boxPos == BoxPos.right ? null :
                () => setState(() {
                  _boxPos = BoxPos.right;
                  _animating = true;
                }),
              child:const Text('Left'),
            ),
          ],
        ),
      ],
    );
  }
}
