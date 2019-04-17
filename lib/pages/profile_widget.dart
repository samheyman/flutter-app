import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../state_widget.dart';
import '../model/state.dart';
import '../pages/login.dart';

class ProfileWidget extends StatelessWidget {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    final _bodyContent = Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top:30),),
        CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(appState.user.photoUrl),
            ),
        Padding(padding: EdgeInsets.only(top:30),),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Name',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Padding(padding: EdgeInsets.only(top:5),),
            Text(appState.user.displayName.toString(),
              style: TextStyle(fontSize: 18),),
            ]
          ),
          trailing: Column(
            children: [
              Text('EDIT',
                style: TextStyle(color: Colors.deepOrange[900]),    
              ),
            ],
          ),
          onTap: () {
            // setState(() {
            //   PrefService.setBool(
            //       'feature_enabled', !PrefService.getBool('feature_enabled'));
            }
        ),
        Padding(padding: EdgeInsets.only(top:20),),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Email',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Padding(padding: EdgeInsets.only(top:5),),
            Text(appState.user.providerData[0].email.toString(),
              style: TextStyle(fontSize: 18),),
            ]
          ),
          trailing: Column(
            children: [
              Text('EDIT',
                style: TextStyle(color: Colors.deepOrange[900]),    
              ),
            ],
          ),
          onTap: () {
            // setState(() {
            //   PrefService.setBool(
            //       'feature_enabled', !PrefService.getBool('feature_enabled'));
            }
        ),
        Padding(padding: EdgeInsets.only(top:20),),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Fist date of last cycle',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Padding(padding: EdgeInsets.only(top:5),),
            Text(DateFormat('dd/MM/yyy').format(appState.firstDayLastPeriod).toString(),
              style: TextStyle(fontSize: 18),),
            ]
          ),
          trailing: Column(
            children: [
              Text('EDIT',
                style: TextStyle(color: Colors.deepOrange[900]),    
              ),
            ],
          ),
          onTap: () {
            // setState(() {
            //   PrefService.setBool(
            //       'feature_enabled', !PrefService.getBool('feature_enabled'));
            }
        ),
        Padding(padding: EdgeInsets.only(top:20),),
        ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Fitness level',
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Padding(padding: EdgeInsets.only(top:5),),
            Text('Advanced',
              style: TextStyle(fontSize: 18),),
            ]
          ),
          trailing: Column(
            children: [
              Text('EDIT',
                style: TextStyle(color: Colors.deepOrange[900]),    
              ),
            ],
          ),
          onTap: () {
            // setState(() {
            //   PrefService.setBool(
            //       'feature_enabled', !PrefService.getBool('feature_enabled'));
            }
        ),
        Padding(padding: EdgeInsets.only(top:30),),
        RaisedButton(
          child: Text("Log out"),
          onPressed: () => {
            StateWidget.of(context).signOutOfFacebook()
          },
        )
      ],
    ),
  ); 

    if (appState.isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null) {
      return LoginScreen();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: _bodyContent,
      );
    }
  }
}

Center _buildLoadingIndicator() {
  return Center(
    child: new CircularProgressIndicator(),
  );
}