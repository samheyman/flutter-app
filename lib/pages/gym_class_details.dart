import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/gym_class.dart';
import '../utils/mama_fit_club_icons.dart';

class GymClassDetails extends StatelessWidget {
  final GymClass gymClass;

  GymClassDetails(this.gymClass);
  
  @override
  Widget build(BuildContext context) {

    final gymClassPrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "SEK " + gymClass.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final headerContentIcon = Container(
        height: 70,
        width: 70,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          MyIcons.stretch,
          color: Theme.of(context).primaryColor,
          size: 40.0,
        ),
    );

    final headerContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(gymClass.image_url),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          height: 280,
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headerContentIcon,
            ]
          ),
        ),
      ],
    );

    final bookButton = RaisedButton(
      onPressed: () => {},
      color: Theme. of(context).primaryColor,
      child:
          Text("SAVE", style: TextStyle(color: Colors.white)),
    );

    final bottomContentText = Column(
      children: [
        Text(gymClass.class_name,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top:5),),
        Text(
          gymClass.gym_name,
          style: TextStyle(fontSize: 14.0),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        bookButton,
        Padding(padding: EdgeInsets.only(top: 15),),
        Row( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Icon(MyIcons.bookings, color: Theme.of(context).secondaryHeaderColor, size: 24,),
                  Padding(padding: EdgeInsets.only(top: 8),),
                  Text("Date",
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Text(DateFormat('EE dd MMM').format(gymClass.date_time))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Icon(Icons.timer, color: Theme.of(context).secondaryHeaderColor, size: 24,),
                  Padding(padding: EdgeInsets.only(top: 8),),
                  Text("Duration",
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Text(gymClass.duration.toString() + " mins")
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Icon(Icons.access_time, color: Theme.of(context).secondaryHeaderColor, size: 24,),
                  Padding(padding: EdgeInsets.only(top: 8),),
                  Text("Time",
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Text(DateFormat('Hm').format(gymClass.date_time))
                ],
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 30),),
        Container(
          // decoration: BoxDecoration(color: Colors.white),
          child: DefaultTabController(    
            length: 2,
            initialIndex: 0,  
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  decoration: BoxDecoration(color: Colors.white),
                  child: TabBar(
                    indicator: BoxDecoration(
                      border: BorderDirectional(
                        top: BorderSide(color: Colors.grey[400], width: 3),
                        end: BorderSide(color: Colors.grey[200], width: 1),
                      ),
                      color: Colors.white),
                      indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[400],
                    indicatorColor: Colors.black,
                    tabs: <Widget>[
                      Text(
                        "Details".toUpperCase(),
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Map".toUpperCase(),
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     child: TabBarView(
                //       children: [
                //         Container(
                //           child: Text("Home Body"),
                //         ),
                //         Container(
                //           child: Text("Articles Body"),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        // Padding(padding: EdgeInsets.only(top: 20),),
        Container(
          decoration: BoxDecoration(
            border: BorderDirectional(top: BorderSide(color: Colors.grey[200], width: 1)),
            color: Colors.white),
          padding: EdgeInsets.all(20),
          child: Text(gymClass.details[0]),
        ),
      ],
    );

    final spacesLeft = Column(
      children: <Widget>[
        Text("(" + gymClass.places.toString() + " places left)")
      ],
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(gymClass.class_name),
      ),
      body: ListView(
        children: <Widget>[
          headerContent,
          bottomContent,
        ],
      ), 
    );
  }
}

