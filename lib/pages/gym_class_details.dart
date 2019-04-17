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
  // final bool savedClass;
  GymClassDetails(this.gymClass); 
  
  @override
  State<StatefulWidget> createState() {
    return _GymClassDetailsState();
  }
}

class _GymClassDetailsState extends State<GymClassDetails> {
  StateModel appState;

  _handleSavedClassesListChanged(String gymClassId) {
      print("Button pressed to save class");
      print("User ID: " + appState.user.uid.toString());
      updateSavedClasses(appState.user.uid, gymClassId).then((result) {
      if (result == true) {
        setState(() {
          if (!appState.savedClasses.contains(gymClassId))
            appState.savedClasses.add(gymClassId);
          else
            appState.savedClasses.remove(gymClassId);
        });
      }
      print(appState.savedClasses[0].toString());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    final gymClassPrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "SEK " + widget.gymClass.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

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
          style: TextStyle(color: Colors.black, fontSize: 38.0),
        ),
        SizedBox(height: 30.0),
        InkWell(
  onTap: () => print('hello'),
  child: Container(
    width: 100.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      border: Border.all(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(child: Text(
      widget.gymClass.price.toInt().toString() + ' krs', 
      style: TextStyle(fontSize: 18.0, color: Colors.white),),),
  ),
),
        
        
      ],
    );

    final headerShortcutIcons = RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0),
        onPressed: (){
          _handleSavedClassesListChanged(widget.gymClass.id);
        },
        child: Icon(
          appState.savedClasses.contains(widget.gymClass.id) == true ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
          size: 30, // New code
        ),
        elevation: 0.0,
    );

    final headerContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/yoga.jpg"),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)),
          child: Center(
            child: headerContentText,
          ),
        ),
      ],
    );

    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: (){
          _handleSavedClassesListChanged(widget.gymClass.id);
        },
        child: Icon(
          // Conditional expression:
          // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
          appState.savedClasses.contains(widget.gymClass.id) == true ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).primaryColor, // New code
        ),
        elevation: 0.0,
        fillColor: Theme.of(context).buttonColor, // New code
        shape: CircleBorder(),
      );
    }

    final bottomContentText = Column(
      children: [
        
        // Padding(padding: EdgeInsets.only(top: 15),),
        // Row( 
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         children: <Widget>[
        //           Icon(MyIcons.bookings, color: Theme.of(context).secondaryHeaderColor, size: 24,),
        //           Padding(padding: EdgeInsets.only(top: 8),),
        //           Text("Date",
        //             style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        //           ),
        //           Padding(padding: EdgeInsets.only(top: 4),),
        //           Text(DateFormat('EE dd MMM').format(widget.gymClass.date_time))
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         children: <Widget>[
        //           Icon(Icons.timer, color: Theme.of(context).secondaryHeaderColor, size: 24,),
        //           Padding(padding: EdgeInsets.only(top: 8),),
        //           Text("Duration",
        //             style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        //           ),
        //           Padding(padding: EdgeInsets.only(top: 4),),
        //           Text(widget.gymClass.duration.toString() + " mins")
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Column(
        //         children: <Widget>[
        //           Icon(Icons.access_time, color: Theme.of(context).secondaryHeaderColor, size: 24,),
        //           Padding(padding: EdgeInsets.only(top: 8),),
        //           Text("Time",
        //             style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        //           ),
        //           Padding(padding: EdgeInsets.only(top: 4),),
        //           Text(DateFormat('Hm').format(widget.gymClass.date_time))
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // Padding(padding: EdgeInsets.only(top: 30),),
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
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
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
    } else if (!appState.isLoading && appState.user == null) {
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

