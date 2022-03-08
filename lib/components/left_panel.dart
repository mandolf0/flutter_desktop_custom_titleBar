import 'package:flutter/material.dart';
import 'package:windows_app/app_constants.dart';
import 'package:windows_app/components/drawer.dart';

class LeftPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: MediaQuery.of(context).size.height - titleBarHeight,
        child: Container(
          color: kcSidebarColor,
          margin: EdgeInsets.all(0),
          child: buildAppDrawer(),
        ));
  }
}
