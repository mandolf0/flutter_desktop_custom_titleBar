/*
Don't forget to add these 2 lines at the beggining of windows\runner\main.cpp

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);

*/

import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windows_app/components/left_panel.dart';
import 'package:windows_app/components/right_panel.dart';
import 'package:windows_app/components/titlebar.dart';
import 'package:windows_app/mobile_screen.dart';

import 'app_constants.dart';

void main() {
  runApp(MyApp());
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      final win = appWindow;
      final initialSize = Size(600, 450);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = appTitle; //"Custom window with Flutter";
      win.show();
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Platform.isWindows ? DesktopScreen() : MobileScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff3c3c3c)),
        primaryColor: Colors.green,
        textTheme: TextTheme(
            caption: TextStyle(
                color: Colors.white, fontFamily: 'opensans', fontSize: 12),
            bodyText1: TextStyle(
                color: Colors.black, fontFamily: 'opensans', fontSize: 12)),
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height

    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          WindowBorder(
            color: borderColor,
            width: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WindowTitleBarBox(
                  child: Container(
                    color: Color(0xff3c3c3c),
                    child: MoveWindow(
                      child: titlebarActions(),
                    ),
                  ),
                ),

                // Expanded(child: Row(children: [LeftSide(), RightSide()])),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //CORE: this is where you place your widgets and their child[ren]
              Expanded(flex: _size.width > 1340 ? 2 : 4, child: LeftPanel()),
              Expanded(flex: _size.width > 1340 ? 8 : 10, child: RightPanel()),
            ],
          ),
          //!CORE status bar
          Expanded(
            child: Container(
              color: Color(0xff3c3c3c),
              child: Row(
                children: [
                  const SizedBox(width: 3),
                  Text('Status bar', style: Theme.of(context).textTheme.caption)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
