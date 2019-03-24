import 'package:flutter/material.dart';
import './home_widget.dart';

void main() => runApp(MamaFitClub());

class MamaFitClub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mama Fit Club",
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}