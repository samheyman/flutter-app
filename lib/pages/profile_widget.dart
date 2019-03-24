import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
 final Color color;

 ProfileWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
    child: Container(
      // margin: const EdgeInsets.all(10.0),
      color: Colors.blue,
      child: Text('Profile', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
    ),
   );
 }
}