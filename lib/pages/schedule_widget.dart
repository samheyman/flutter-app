import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Container(
    child: Container(
      // margin: const EdgeInsets.all(10.0),
      child: Text('Schedule', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
    ),
   );
 }
}