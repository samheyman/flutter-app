import 'package:flutter/material.dart';
import '../../model/gym_class.dart';
import 'package:intl/intl.dart';
import '../gym_class_details.dart';

class GymClassCard extends StatelessWidget {
  final GymClass gymClass;
  final bool inBookedClasses;
  final Function onSaveButtonPressed;

  GymClassCard(
    {@required this.gymClass,
    @required this.inBookedClasses,
    @required this.onSaveButtonPressed,}
  );

  @override
  Widget build(BuildContext context) {

    ListTile _buildListTile() {
      return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        trailing: Container(
          child: Column(
            children: [
              Icon(Icons.chevron_right, size: 22,)
            ],
          ),
        ),
        leading: Container(
          padding: EdgeInsets.only(right: 2.0),
          
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1.0, color: Colors.white24))),
          child: Container(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    DateFormat('Hm').format(gymClass.date_time).toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor, 
                      fontSize: 16,
                      fontWeight: FontWeight.normal )),
                ),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.grey, size: 14,),
                    Text(
                      " " + gymClass.duration.toString() + " min",
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.black54
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18,),
              ],
            ),
          ),
        ),
        title: Text(
          gymClass.class_name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).primaryColor, 
            fontWeight: FontWeight.bold,
            fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text(
              gymClass.gym_name,
              style: TextStyle(
                color: Colors.black54, 
                fontSize: 14
              ),
            ),
            SizedBox(height: 5,),
            (gymClass.spaces_available>0) ? 
              Text(gymClass.spaces_available.toString() + " places left", 
                style: TextStyle(
                  color: Colors.green, 
                  fontSize: 10),) : 
              Row (
                children: [
                  Icon(Icons.warning, size: 10, color: Colors.amber[900],),
                  Text(" Class fully booked",
                    style: TextStyle(
                      color: Colors.amber[900], 
                      fontSize: 10
                    ),
                  ),
                ],
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GymClassDetails(gymClass)),
        )
      },
      child: Padding(
        padding: EdgeInsets.only(top:10),
        child: Card(
          child: _buildListTile(),
        ),
      ),
    );
  }
}