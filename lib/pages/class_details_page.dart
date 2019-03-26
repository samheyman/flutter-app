import 'package:flutter/material.dart';
import '../model/gym_class.dart';

class ClassDetailsPage extends StatelessWidget {
  final GymClass gymClass;
  ClassDetailsPage(this.gymClass);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(gymClass.name),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/pregnant_spinning.png', height: 200),
          Text('Gym class'),

        ],
      ),
    );
  }
}

