import 'package:flutter/material.dart';
import '../../model/gym_class.dart';
import 'package:intl/intl.dart';
import '../classes_widget.dart';

class RecommendedGymClassCard extends StatelessWidget {
  // final GymClass gymClass;
  // final bool inBookedClasses;
  // final Function onSaveButtonPressed;

  RecommendedGymClassCard(
    // {@required this.gymClass,
    // @required this.inBookedClasses,
    // @required this.onSaveButtonPressed,}
  );

  @override
  Widget build(BuildContext context) {

    ListTile _buildListTile() {
      return ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage('images/yoga.jpg')),
        title: Text("Pregnancy yoga", style: TextStyle(fontSize: 14),),
        subtitle: Text("SATS, Sturegatan"),
        trailing: Column(
          children: [
            Icon(Icons.alarm),
            Text("Friday"),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClassesWidget(),
        ))
      },
      child: _buildListTile(),
    );
  }
}