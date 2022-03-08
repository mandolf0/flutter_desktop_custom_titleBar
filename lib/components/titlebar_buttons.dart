import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:windows_app/app_constants.dart';

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3c3c3c),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MinimizeWindowButton(colors: buttonColors),
          MaximizeWindowButton(colors: buttonColors),
          CloseWindowButton(colors: closeButtonColors),
        ],
      ),
    );
  }
}
