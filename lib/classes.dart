import 'package:flutter/material.dart';
import './model/gym_class.dart';
import './pages/class_details_page.dart';

class Classes extends StatelessWidget{

  final List<GymClass> classes;
  Classes(this.classes);

  _goToClassDetails(BuildContext context, GymClass gymClass) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) => ClassDetailsPage(gymClass)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      // class entry begins here: can be card or container
      children: 
        classes.map((element) => Card(
        // elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(164, 175, 196, .5)),
          child: makeClassBox(context, element),
        ),
      )).toList(),  
    );
  }

  ListTile makeClassBox(BuildContext context, GymClass gymClass) => ListTile(
    contentPadding:
        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Container(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
              gymClass.time,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, )),
            ),
            Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey, size: 14,),
                  Text(
                    " " + gymClass.duration.toString() + "min",
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
            ),
          ],
      ),
      ),
    ),
    title: Text(
      gymClass.name,
      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      gymClass.location,
      style: TextStyle(color: Colors.black54, fontSize: 12)
    ),
    onTap: () {
      _goToClassDetails(context, gymClass);
    },
  );
}


  
// Row makeClassBox(GymClass gymClass) => Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Expanded(
//         flex: 25,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.only(bottom: 2),
//               child: Text(
//                 gymClass.time,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ), 
//             ),       
//             Row(
//               children: [
//                 Icon(
//                   Icons.access_time,
//                   size: 12,
//                   color: Colors.blueGrey,
//                 ),
//                 Text(
//                   " " + (gymClass.duration).toString(),
//                   style: TextStyle(fontSize: 12, color: Colors.blueGrey),
//                 ),
//               ]
//             ),
//           ]
//         ),
//       ),
//       Expanded(
//         flex:75,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,   
//           children: [
//             Container(
//               padding: EdgeInsets.only(bottom: 5),
//               child: Text(
//                 gymClass.name.toUpperCase(),
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             Text(
//               gymClass.location,
//               style: TextStyle(fontSize: 12),
//             ),
//           ],
//         ),
//       ),
//     ],
// );