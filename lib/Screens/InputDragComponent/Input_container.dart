import 'package:events_emitter/events_emitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_insta_firebase/Screens/EventEmitter/input_event_emitter.dart';

class InputContainer extends StatefulWidget {
  final String hintText;
  const InputContainer({super.key, required this.hintText});

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  Color colorContainer = Colors.transparent;

    final person = InputEventEmitter('John');


  @override
  Widget build(BuildContext context) {
    person.on('say', (String message) => print('${person.name} said: $message'));

    return Container(
      height: 50,
      width: 150,
      color: colorContainer,
      child: TextField(
        decoration: InputDecoration(hintText: widget.hintText),
        // controller: controller,
        // onChanged: onChanged())
      ),
    );
  }
}
