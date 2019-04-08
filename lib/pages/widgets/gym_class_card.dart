import 'package:flutter/material.dart';
import '../../model/gym_class.dart';
import 'package:intl/intl.dart';

class GymClassCard extends StatelessWidget {
  final GymClass gymClass;
  final bool inFavorites;
  final Function onFavoritesButtonPressed;

  GymClassCard(
    {@required this.gymClass,
    @required this.inFavorites,
    @required this.onFavoritesButtonPressed,}
  );

  @override
  Widget build(BuildContext context) {

    // RawMaterialButton _buildFavoriteButton() {
    //   return RawMaterialButton(
    //     constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
    //     onPressed: () => onFavoritesButtonPressed(gymClass.id),
    //     child: Icon(
    //       // Conditional expression:
    //       // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
    //       inFavorites == true ? Icons.favorite : Icons.favorite_border,
    //     ),
    //     elevation: 2.0,
    //     fillColor: Colors.white,
    //     shape: CircleBorder(),
    //   );
    // }

    Padding _buildListTile() {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        leading: Container(
          padding: EdgeInsets.only(right: 2.0),
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
                    DateFormat('Hm').format(gymClass.dateTime),
                    // (gymClass['date'].toDate()).DateFormat.Hm,
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
        ),
      );
    }

    return GestureDetector(
      onTap: () => print("Tapped!"),
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0, bottom: 0),
        child: Card(
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
              //         recipe.imageURL,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     Positioned(
              //       child: _buildFavoriteButton(),
              //       top: 2.0,
              //       right: 2.0,
              //     ),
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