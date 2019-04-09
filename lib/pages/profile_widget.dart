import 'package:flutter/material.dart';
import '../state_widget.dart';

class ProfileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Log out"),
        onPressed: () => StateWidget.of(context).signOutOfGoogle(),
      )
    ); 
  }
}