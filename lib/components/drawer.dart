import 'package:flutter/material.dart';

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
