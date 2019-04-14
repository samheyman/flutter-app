import 'package:flutter/material.dart';
import '../state_widget.dart';

class GuideWidget extends StatelessWidget {

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
            Text("Your guide to exercising throughout your pregnancy.")
          ],
        ),
      ),
    ); 
  }
}