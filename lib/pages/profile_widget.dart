import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Container(
    child: Container(
      // margin: const EdgeInsets.all(10.0),
      child: Text('Profile', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
    ),
   );
 }
}