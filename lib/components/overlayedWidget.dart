import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

typedef PointMoveCallBack = void Function(Offset offset, Key? key);

class OverLayedWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onDragStart;
  final PointMoveCallBack onDragEnd;

  final PointMoveCallBack onDragUpdate;

  const OverLayedWidget(
      {super.key,
      required this.child,
      required this.onDragStart,
      required this.onDragEnd,
      required this.onDragUpdate});
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    late Offset offset;
    return Listener(
      onPointerMove: (event) {
        offset = event.position;
        onDragUpdate(offset, key);
      },
      child: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        onScaleStart: () {
          onDragStart();
        },
        onScaleEnd: () {
          onDragEnd(offset, key);
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
      ),
    );
  }
}
