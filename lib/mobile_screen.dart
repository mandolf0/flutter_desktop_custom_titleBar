import 'package:flutter/material.dart';
import 'package:windows_app/app_constants.dart';
import 'package:windows_app/components/drawer.dart';
import 'package:windows_app/components/right_panel.dart';
import 'package:windows_app/components/titlebar.dart';

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
          Expanded(child: RightPanel()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Color(0xff73a1d0),
        onTap: (value) => print(value),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
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
