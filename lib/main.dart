/*
Don't forget to add these 2 lines at the beggining of windows\runner\main.cpp

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);

*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

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

const borderColor = Color(0xFF805306);
const String appTitle = 'Custom Flutter window';
const double titleBarHeight = 34;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Platform.isWindows ? DesktopScreen() : MobileScreen(),
      theme: ThemeData(primaryColor: Colors.green),
    );
  }
}

class MobileScreen extends StatelessWidget {
  // const MobileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: [],
      ),
      drawer: buildAppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Spacer(),
          titlebarActions(),
          Expanded(child: RightSide()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff73a1d0),
        onTap: (value) => print(value),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Details'),
        ],
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
              Expanded(flex: _size.width > 1340 ? 2 : 4, child: LeftSide()),
              Expanded(flex: _size.width > 1340 ? 8 : 10, child: RightSide()),
            ],
          ),
        ],
      ),
    );
  }
}

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
      return Row(
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
      );
    } else {
      return Container();
    }
  }
}

const sidebarColor = Color(0xFFF6A00C);

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: MediaQuery.of(context).size.height - titleBarHeight,
        child: Container(
          color: sidebarColor,
          margin: EdgeInsets.all(0),
          child: buildAppDrawer(),
        ));
  }
}

class buildAppDrawer extends StatelessWidget {
  const buildAppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Color(0xff73a1d0),
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text('Settings'),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              onTap: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Handle profile'))),
              title: Text('Profile'),
              trailing: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}

const backgroundStartColor = Color(0xFFc3c3c3);
const backgroundEndColor = Color(0xFFc3c3c3);

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height - titleBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundStartColor, backgroundEndColor],
            stops: [0.0, 1.0]),
      ),
      child: Column(mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          //!CORE right panel
          children: [
            ListView(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 9),
              shrinkWrap: true,
              children: [Text('one')],
            )
          ]),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF969696),
    mouseOver: Color(0xFF474748),
    mouseDown: Color(0xFF141414),
    iconMouseOver: Color(0xFF969696),
    iconMouseDown: Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    iconNormal: Color(0xFF969696),
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
    iconMouseOver: Colors.white);

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
