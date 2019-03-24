import 'package:flutter/material.dart';

class ClassesWidget extends StatelessWidget {
 final Color color;

 ClassesWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
    child: Container(
      // margin: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Text('Classes', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
    ),
   );
 }
}