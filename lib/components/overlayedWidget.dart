import 'package:events_emitter/events_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Screens/InputDragComponent/Input_container.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

typedef PointMoveCallBack = void Function(Offset offset, Key? key);

class OverLayedWidget extends StatefulWidget {
  // final Widget child;
  final VoidCallback onDragStart;
  final PointMoveCallBack onDragEnd;
  final PointMoveCallBack onDragUpdate;

  const OverLayedWidget(
      {super.key,
      // required this.child,
      required this.onDragStart,
      required this.onDragEnd,
      required this.onDragUpdate});

  @override
  State<OverLayedWidget> createState() => _OverLayedWidgetState();
}

class _OverLayedWidgetState extends State<OverLayedWidget> {
  // var _child;
  @override
  Widget build(BuildContext context) {
    // _child = InputContainer();
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    late Offset offset;
    return Listener(
      onPointerMove: (event) {
        offset = event.position;
        widget.onDragUpdate(offset, widget.key);
      },
      child: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        onScaleStart: () {
          widget.onDragStart();
        },
        onScaleEnd: () {
          widget.onDragEnd(offset, widget.key);
        },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, childWidget) {
            return Transform(
                transform: notifier.value,
                child: const Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: InputContainer(
                      hintText: 'dfdf',
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
