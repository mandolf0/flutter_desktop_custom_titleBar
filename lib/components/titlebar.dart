import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:windows_app/app_constants.dart';
import 'package:windows_app/components/titlebar_buttons.dart';

class titlebarActions extends StatelessWidget {
  const titlebarActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.undo),
          color: Colors.blue,
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {},
          color: Colors.grey,
          icon: Icon(Icons.redo),
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.save),
          color: Colors.green,
          iconSize: 20,
        ),
        Text("|"),
        const SizedBox(width: 10),
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        const SizedBox(width: 10),
        titleBarButtons(context)
      ],
    );
  }

  Widget titleBarButtons(BuildContext context) {
    if (Platform.isWindows) {
      return Expanded(
        child: Row(
          children: [
            Text(
              appTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Spacer(),
            WindowButtons(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
