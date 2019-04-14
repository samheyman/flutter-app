import 'package:flutter/material.dart';
import '../state_widget.dart';

class ProfileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("Mama Fit Club"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              title: Text('First name'),
              trailing: Checkbox(
                value: true,
                onChanged: (val) {
                  // setState(() {
                  //   PrefService.setBool('feature_enabled', val);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   PrefService.setBool(
                //       'feature_enabled', !PrefService.getBool('feature_enabled'));
                }
            ),
            ListTile(
              title: Text('Last name'),
              trailing: Checkbox(
                value: true,
                onChanged: (val) {
                  // setState(() {
                  //   PrefService.setBool('feature_enabled', val);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   PrefService.setBool(
                //       'feature_enabled', !PrefService.getBool('feature_enabled'));
                }
            ),
            ListTile(
              title: Text('Due date'),
              trailing: Checkbox(
                value: true,
                onChanged: (val) {
                  // setState(() {
                  //   PrefService.setBool('feature_enabled', val);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   PrefService.setBool(
                //       'feature_enabled', !PrefService.getBool('feature_enabled'));
                }
            ),
            ListTile(
              title: Text('Fitness level'),
              trailing: Checkbox(
                value: true,
                onChanged: (val) {
                  // setState(() {
                  //   PrefService.setBool('feature_enabled', val);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   PrefService.setBool(
                //       'feature_enabled', !PrefService.getBool('feature_enabled'));
                }
            ),
            RaisedButton(
              child: Text("Log out"),
              onPressed: () => {
                StateWidget.of(context).signOutOfFacebook()
              },
            )
          ],
        ),
      ),
    ); 
  }
}