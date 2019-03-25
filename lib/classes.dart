import 'package:flutter/material.dart';

class Classes extends StatelessWidget{

  final List<List> classes;
  Classes(this.classes);

  @override
  Widget build(BuildContext context) {
    return Column(
      // class tile begins here
      children: classes.map((element) => Container(
        padding: const EdgeInsets.all(20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        element[0],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), 
                    ),       
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          " " + element[1],
                          style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                        ),
                      ]
                    ),
                  ]
                ),
              ),
              Expanded(
                flex:75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,   
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        element[2].toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      element[3],
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
        ),
      )).toList(),  
    );
  }
}
  
