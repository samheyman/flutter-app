import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ClassesWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
      return _ClassesWidgetState();
  }
}

class _ClassesWidgetState extends State<ClassesWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My classes")
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('gymClasses').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      print(snapshot.data.documents[0]['date'].toDate().hour);
      return _buildList(context, snapshot.data.documents);
    },
  );
}

Widget _buildList(BuildContext context, List documents) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: 
      documents.map((element) => Card(
        // elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(164, 175, 196, .5)),
          child: _buildListItem(context, element),
        ),
      ),
    ).toList(),  
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot gymClass) {
  return ListTile(
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
                DateFormat('Hm').format(gymClass['date'].toDate()),
                // (gymClass['date'].toDate()).DateFormat.Hm,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, )),
            ),
            Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey, size: 14,),
                  Text(
                    " " + gymClass['duration'].toString() + "min",
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
            ),
          ],
      ),
      ),
    ),
    title: Text(
      gymClass['name'],
      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      gymClass['location'],
      style: TextStyle(color: Colors.black54, fontSize: 12)
    ),
    onTap: () {
      // _goToClassDetails(context, gymClass);
    },
  );
}


// _goToClassDetails(BuildContext context, DocumentSnapshot gymClass) {
//   Navigator.of(context).push(
//     new MaterialPageRoute(
//       builder: (context) => GymClassDetails(gymClass)
//     )
//   );
// }