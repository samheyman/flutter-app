import 'package:flutter/material.dart';
import '../classes.dart';

class ClassesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _ClassesWidgetState();
    }
}

class _ClassesWidgetState extends State<ClassesWidget> {

  List<List> _classes = [
    ['10:30', '60min', 'Pre-natal yoga', 'My Gym'],
    ['14:00', '90min', 'Pre-natal Pilates', 'Fitness Centre'],
    ['15:00', '60min', 'Water Aerobics', 'Communal Centre'],
    ['18:00', '120min', 'Spinning', 'Aero Club'],
    ['20:30', '90min', 'Outdoor Pre-natal HIIT', 'Sport Centre'],
  ];

  @override
  Widget build(BuildContext context) {
    return Classes(_classes);
  }
}