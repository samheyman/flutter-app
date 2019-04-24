import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../state_widget.dart';
import '../model/state.dart';
import '../pages/login.dart';
import './settings_pages/edit_name.dart';

class ProfileWidget extends StatelessWidget {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    _getProfilePhoto() {
      if(appState.user!=null) {
        try {
            return NetworkImage(appState.user.photoUrl);
        } catch (NoSuchMethodError) {
          return AssetImage("images/logo.png");
        }
      } else {
          return AssetImage("images/logo.png");
      }
    }
    _getName() {
      if(appState.user!=null) {
        try {
          return Text(appState.user.providerData[0].displayName.toString(),
                style: TextStyle(fontSize: 18),);
        } catch (NoSuchMethodError) {
          return Text("",
                style: TextStyle(fontSize: 18),);
        }
      } else {
        return Text("",
                style: TextStyle(fontSize: 18),);
      }
    }
    _getEmail() {
      if(appState.user!=null) {      
        try {
            return Text(appState.user.providerData[0].email.toString(),
                style: TextStyle(fontSize: 18),);
        } catch (NoSuchMethodError) {
          return Text("",
                style: TextStyle(fontSize: 18),);
        }
      } else {
        return Text("",
                style: TextStyle(fontSize: 18),);
      }
    }
    _getDueDate() {
      // print(appState.firstDayLastPeriod).toString());
      if(appState.user!=null) {
        try {
            return Text(DateFormat('dd/MM/yyy').format(appState.firstDayLastPeriod).toString(),
                style: TextStyle(fontSize: 18),);
        } catch (NoSuchMethodError) {
          return Text("Please enter a date",
                style: TextStyle(fontSize: 18),);
        }
      } else {
        return Text("Please enter a date",
                style: TextStyle(fontSize: 18),);
      }
    }
    _getFitnessLevel() {
      if(appState.user!=null) {
        try {
            return Text(appState.fitnessLevel.toString(),
                style: TextStyle(fontSize: 18),);
        } catch (NoSuchMethodError) {
          return Text("",
                style: TextStyle(fontSize: 18),);
        }
      } else {
        return Text("",
                style: TextStyle(fontSize: 18),);
      }
    }


    appState = StateWidget.of(context).state;
    final _bodyContent = Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top:30),),
        CircleAvatar(
              radius: 40.0,
              backgroundImage: _getProfilePhoto(),
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
              _getName(),
            ]
          ),
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
            _getEmail(),
            ]
          ),
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
            _getDueDate(),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditName("name")),
            );
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
            _getFitnessLevel(),
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EditName(appState.user.displayName)),
            // );
          }
        ),
        Padding(padding: EdgeInsets.only(top:30),),
        RaisedButton(
          child: Text("Log out"),
          onPressed: () => {
            StateWidget.of(context).signOut(),
            // Navigator.of(context).pushNamed('/login'),
          },
        )
      ],
    ),
  ); 

    // if (appState.isLoading) {
    //   return Scaffold(
    //     backgroundColor: Theme.of(context).backgroundColor,
    //     body: _buildLoadingIndicator(),
    //   );
    // } else if (!appState.isLoading && appState.user == null && appState.loginRequired) {
    //   return LoginScreen();
    // } else {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: _bodyContent,
      );
    // }
  }
}

Center _buildLoadingIndicator() {
  return Center(
    child: new CircularProgressIndicator(),
  );
}

