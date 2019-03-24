import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
 final Color color;

 DashboardWidget(this.color);

 @override
 Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Trimester 1', 
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
            Text('13 weeks, 1 day', 
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black, fontSize: 16)),
          ],
        ),
      ),
    );
 }
}