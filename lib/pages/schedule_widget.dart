import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
 final Color color;

 ScheduleWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
    child: Container(
      // margin: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Text('Schedule', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
    ),
   );
 }
}