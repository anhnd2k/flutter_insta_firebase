import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class OverLayedWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;

  const OverLayedWidget(
      {super.key,
      required this.child,
      required this.onDragStart,
      required this.onDragEnd});
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return MatrixGestureDetector(
      onMatrixUpdate: (m, tm, sm, rm) {
        notifier.value = m;
      },
      onScaleStart: () {
        onDragStart();
      },
      onScaleEnd: () {
        onDragEnd();
      },
      child: AnimatedBuilder(
        animation: notifier,
        builder: (ctx, childWidget) {
          return Transform(
              transform: notifier.value,
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: child,
                ),
              ));
        },
      ),
    );
  }
}
