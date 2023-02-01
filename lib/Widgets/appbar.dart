import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar getAppBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/images/camera_icon.svg",
          width: 30,
        ),
        const Text(
          "Instagram",
          style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
        ),
        SvgPicture.asset(
          "assets/images/message_icon.svg",
          width: 30,
        ),
      ],
    ),
  );
}