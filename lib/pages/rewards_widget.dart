import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../state_widget.dart';
import '../pages/profile_widget.dart';

class RewardsWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("Rewards"),
        actions: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(),
                      )
                    )
                  },
                  child: Icon(Icons.settings),
                ),
                padding: EdgeInsets.all(10),
              ),
            ],
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://raw.githubusercontent.com/samheyman/flutter-app/master/images/rewards.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    ); 
  }
}
