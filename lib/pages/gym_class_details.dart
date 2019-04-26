import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/gym_class.dart';
import '../utils/mama_fit_club_icons.dart';
import '../model/state.dart';
import '../data/gym_classes.dart';
import '../pages/login.dart';
import '../state_widget.dart';

class GymClassDetails extends StatefulWidget {

  final GymClass gymClass;
  GymClassDetails(this.gymClass); 
  
  @override
  State<StatefulWidget> createState() {
    return _GymClassDetailsState();
  }
}

class _GymClassDetailsState extends State<GymClassDetails> {
  StateModel appState;

  _handleBookedClassesListChanged(String gymClassId) {
      print("Button pressed to save class");
      print("User ID: " + appState.user.uid.toString());
      updateBookedClasses(appState.user.uid, gymClassId).then((result) {
      if (result == true) {
        setState(() {
          if (!appState.bookedClasses.contains(gymClassId))
            appState.bookedClasses.add(gymClassId);
          else
            appState.bookedClasses.remove(gymClassId);
        });
      }
      // print(appState.bookedClasses[0].toString());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    final headerContentText = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[   
        SizedBox(height: 20.0),
        Text(
          widget.gymClass.gym_name,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),     
        SizedBox(height: 20.0),
        Text(
          widget.gymClass.class_name,
          style: TextStyle(color: Colors.black, fontSize: 38.0,), textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.0),
      ],
    );

    final bookingButton = Container(
      child: appState.bookedClasses.contains(widget.gymClass.id) == true ?
        InkWell(
          onTap: () => { 
            // _handleBookedClassesListChanged(widget.gymClass.id),
          },
          child: Container(
            width: 160.0,
            height: 65.0,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Icon(Icons.check_circle_outline, color: Colors.grey[700],),
                Text(
                  "Class booked!", 
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ) :
        InkWell(
          onTap: () => { 
            _handleBookedClassesListChanged(widget.gymClass.id),
          },
          child: Container(
            width: 130.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                "Book class", 
                style: TextStyle(fontSize: 18.0, color: Colors.white),),
              ), 
          ),
        ),
      );

    final headerShortcutIcons = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Share  "),  
        GestureDetector(
          // constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0),
          onTap: (){
            // _handleBookedClassesListChanged(widget.gymClass.id);
          },
          child: Image.asset(
            'images/facebook_share_icon.png',
            height: 22,
          ),
        ),
      ]
    );

    final headerContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.gymClass.image_url),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.6)),
          child: Center(
            child: headerContentText,
          ),
        ),
      ],
    );

    final bottomContentText = Column(
      children: [
        bookingButton,
        SizedBox(height: 30,),
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
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Theme.of(context).secondaryHeaderColor),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Text(DateFormat('EE dd MMM').format(widget.gymClass.date_time), 
                    style: TextStyle(color: Theme.of(context).secondaryHeaderColor))
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
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Theme.of(context).secondaryHeaderColor),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Text(widget.gymClass.duration.toString() + " mins",
                    style: TextStyle(color: Theme.of(context).secondaryHeaderColor),)
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
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Theme.of(context).secondaryHeaderColor,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Text(DateFormat('Hm').format(widget.gymClass.date_time),
                    style: TextStyle(color: Theme.of(context).secondaryHeaderColor,),),
                ],
              ),
            ),
          
            // Expanded(flex: 5, child: Text("")),
            // Expanded(
            //     flex: 6,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 10.0),
            //         child: Text(
            //           widget.gymClass.address,
            //           style: TextStyle(color: Colors.white),
            //         ))),
            // Expanded(flex: 0, child: gymClassPrice ),
          ],
        ),
        SizedBox(height: 30,),
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Text(widget.gymClass.details[0]),
               
            ],
          )
        ),
      ],
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.only(top:20.0),
      child: Container(
        child: bottomContentText,
      ),
    );

    Center _buildLoadingIndicator() {
      return Center(
        child: new CircularProgressIndicator(),
      );
    } 

    if (appState.isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: headerShortcutIcons,
        ),
        body: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null && appState.loginRequired) {
      return LoginScreen();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: headerShortcutIcons,
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
}

