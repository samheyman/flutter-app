import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/gym_class.dart';
import '../../utils/mama_fit_club_icons.dart';
import '../../model/state.dart';
import '../../pages/login.dart';
import '../../state_widget.dart';

class EditName extends StatefulWidget {

  final String name;
  // final bool savedClass;
  EditName(this.name); 
  
  @override
  State<StatefulWidget> createState() {
    return _EditNameState();
  }
}

class _EditNameState extends State<EditName> {
  StateModel appState;
  
  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    

    

    
    

    

    Center _buildLoadingIndicator() {
      return Center(
        child: new CircularProgressIndicator(),
      );
    } 

    if (appState.isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Edit name'),
        ),
        body: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null) {
      return LoginScreen();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Edit name'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal:30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  // border: InputBord,
                  hintText: widget.name,
                ),
              ),
              SizedBox(height: 50,),
              RaisedButton(
                color: Colors.blue,
                onPressed: ()=> {},
                child: Text("SAVE",
                  style: TextStyle(color: Colors.white)),
              ),
              RaisedButton(
                onPressed: ()=> {},
                child: Text("Cancel"),
              )
            ],
          ),
        ), 
      );
    }
  }
}

