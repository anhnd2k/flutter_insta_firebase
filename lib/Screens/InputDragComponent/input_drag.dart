import 'dart:developer';

import 'package:flutter/material.dart';

class InputDrag extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function changeColor;
  const InputDrag(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.changeColor});

  @override
  Widget build(BuildContext context) {

    changeColor() {
      print('change color');
    }

    return Container(
      height: 50,
      width: 150,
      color: Colors.black,
      child: TextField(
          decoration: const InputDecoration(hintText: 'enter'),
          controller: controller,
          onChanged: onChanged),
    );
  }
}
