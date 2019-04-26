import 'package:flutter/material.dart';
import '../state_widget.dart';

class RewardsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _icon_size = 24;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("Rewards"),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Rewards'),

          ],
        ),
      ),
    ); 
  }
}
