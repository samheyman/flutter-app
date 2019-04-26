import 'package:flutter/material.dart';
import '../../model/gym_class.dart';
import 'package:intl/intl.dart';
import '../gym_class_details.dart';

class BookedGymClassCard extends StatelessWidget {
  final GymClass gymClass;
  final bool inBookedClasses;
  final Function onSaveButtonPressed;

  BookedGymClassCard(
    {@required this.gymClass,
    @required this.inBookedClasses,
    @required this.onSaveButtonPressed,}
  );

  @override
  Widget build(BuildContext context) {

    Padding _buildListTile() {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        leading: Container(
          padding: EdgeInsets.only(right: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1.0, color: Colors.white24))),
          child: Container(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(gymClass.image_url),
                ),
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
            fontSize: 18),
        ),
        subtitle: Text(
          gymClass.gym_name,
          style: TextStyle(
            color: Colors.black54, 
            fontSize: 14  )
          ),
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
          margin: EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              // Stack(
              //   children: <Widget>[
              //     AspectRatio(
              //       aspectRatio: 16.0 / 9.0,
              //       child: Image.network(
              //         gymClass.image_url,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     // Positioned(
              //     //   child: _buildFavoriteButton(),
              //     //   top: 2.0,
              //     //   right: 2.0,
              //     // ),
              //   ],
              // ),
              _buildListTile(),
            ],
          ),
        ),
      ),
    );
  }
}