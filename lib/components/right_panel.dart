import 'package:flutter/material.dart';
import 'package:windows_app/app_constants.dart';

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height - titleBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kcBackgroundStartColor, kcBackgroundEndColor],
            stops: [0.0, 1.0]),
      ),
      child: Column(mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          //!CORE right panel

          children: [
            Material(
              type: MaterialType.transparency,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                shrinkWrap: true,
                children: [
                  MyListTile(
                    title: 'Item Title',
                    onTap: () => print('list item callback'),
                  ),
                  MyListTile(title: 'Item Title'),
                  MyListTile(title: 'Item Title'),
                  MyListTile(title: 'Item Title'),
                  MyListTile(title: 'Item Title'),
                ],
              ),
            )
          ]),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MyListTile({Key key, @required String this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.tealAccent,
      onTap: onTap,
      hoverColor: Colors.amberAccent,
      title: Text(title),
    );
  }
}
