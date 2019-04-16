import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../data/gym_classes.dart';
import '../model/gym_class.dart';
import '../utils/theme.dart';
import './widgets/gym_class_card.dart';
import './gym_class_details.dart';
import '../model/state.dart';
import '../state_widget.dart';
import '../pages/login.dart';


class ClassesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _ClassesWidgetState();
  }
}

class _ClassesWidgetState extends State<ClassesWidget> {
  // List<GymClass> gymClasses = getGymClasses();
  StateModel appState;

  // void _handleSavedClassesListChanged(String savedClassId) {
  //   updateSavedClasses(appState.user.uid, savedClassId).then((result) {
  //     // Update the state:
  //     if (result == true) {
  //       setState(() {
  //         if (!appState.savedClasses.contains(savedClassId))
  //           appState.savedClasses.add(savedClassId);
  //         else
  //           appState.savedClasses.remove(savedClassId);
  //       });
  //     }
  //   });
  // }

  DefaultTabController _buildTabView({Widget body}) {

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Classes'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              _buildTab(0),
              _buildTab(1),
              _buildTab(2),
              _buildTab(3),
              _buildTab(4),
              _buildTab(5),
              _buildTab(6),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: body,
        ),
      ),
    );
  }

  TabBarView _buildTabsContent() {
    Padding _buildGymClasses({DateTime gymClassDate}) {
      CollectionReference collectionReference =
          Firestore.instance.collection('gymClasses');
      Stream<QuerySnapshot> stream;
      // The argument recipeType is set
      if (gymClassDate != null) {
        print(gymClassDate);
        stream = collectionReference 
            .where("date_time", isGreaterThan: gymClassDate)
            .where("date_time", isLessThanOrEqualTo: gymClassDate.add(Duration(days: 1)))
            .snapshots();
      } else {
        print("Gym class found");
        // Use snapshots of all recipes if recipeType has not been passed
        stream = collectionReference.snapshots();
      }

      // Define query depeneding on passed args
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DateFormat('d MMMM').format(gymClassDate).toString().toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Colors.grey[500],
                fontSize: 18),
              textAlign: TextAlign.start,),
            Expanded(
              child: StreamBuilder(
                stream: stream,
                builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return _buildLoadingIndicator();
                    return 
                        ListView(
                          padding: EdgeInsets.all(0),
                          children: 
                            snapshot.data.documents
                              // Check if the argument ids contains document ID if ids has been passed:
                              // .where((d) => ids == null || ids.contains(d.documentID))
                              .map((document) {
                                // print(snapshot.data.documents[0]['created_date'].toString());
                            return GymClassCard(
                              gymClass:
                                  GymClass.fromMap(document.data, document.documentID),
                              // inSavedClasses:
                              //     appState.savedClasses.contains(document.documentID),
                              // onSaveButtonPressed: _handleSavedClassesListChanged,
                            );
                          }).toList(),
                        );
                },
              ),
            ),
          ],
        ),
      );
    }

    return TabBarView(
      children: [
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)),
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 1))),
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 2))),
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 3))),
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 4))),
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 5))),
        _buildGymClasses(gymClassDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 6))),
      ],
    );
  }
  
  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildTabView(
        body: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null) {
      return LoginScreen();
    } else {
      return _buildTabView(
        body: _buildTabsContent(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

    // Column _buildGymClasses(List<GymClass> gymClassList) {
    //   return Column(
    //     children: <Widget>[
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: gymClassList.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return GymClassCard(
    //               gymClass: gymClassList[index],
    //               inSavedClasses: userSavedClasses.contains(gymClassList[index].id),
    //               onSaveButtonPressed: _handleSavedClassesListChanged,);
    //           },
    //         ),
    //       ),
    //     ],
    //   );
    // }

    // return DefaultTabController(
    //   length: 7,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Classes'),
    //       bottom: TabBar(
    //         isScrollable: true,
    //         tabs: [
    //           _buildTab(0),
    //           _buildTab(1),
    //           _buildTab(2),
    //           _buildTab(3),
    //           _buildTab(4),
    //           _buildTab(5),
    //           _buildTab(6),
    //         ],
    //       ),
    //     ),
    //     body: Padding(
    //       padding: EdgeInsets.all(0.0),
    //       child: TabBarView(
    //         // Replace placeholders:
    //         children: [
    //           // Display recipes of type food:
    //           _buildGymClasses(
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().day)
    //               .toList()),
    //           // Display recipes of type drink:
    //           _buildGymClasses(gymClasses
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().add(Duration(days:1)).day)
    //               .toList()),
    //           // Display favorite recipes:
    //           _buildGymClasses(gymClasses
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().add(Duration(days:2)).day)
    //               .toList()),
    //           _buildGymClasses(gymClasses
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().add(Duration(days:3)).day)
    //               .toList()),
    //           _buildGymClasses(gymClasses
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().add(Duration(days:4)).day)
    //               .toList()),
    //           _buildGymClasses(gymClasses
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().add(Duration(days:5)).day)
    //               .toList()),
    //           _buildGymClasses(gymClasses
    //               .where((gymClass) => gymClass.date_time.day == DateTime.now().add(Duration(days:6)).day)
    //               .toList()),
    //           // Center(child: Icon(Icons.settings)),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  
}

Widget _buildTab(int daysFromNow) {
  String day = 'today';

  if (daysFromNow != 0) {
    day = DateFormat('E').format(DateTime.now().add(Duration(days: daysFromNow))).toString();
  }

  return Tab(
    child: Container(
      child: Column(
        children: [
          Text(
            day.toUpperCase(), 
            style: TextStyle(fontSize: 9), 
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
          ),
          Text(
            DateFormat('d').format(DateTime.now().add(Duration(days: daysFromNow))).toString(), 
            style: TextStyle(fontSize: 16,), 
          ),
        ],
      ),
    ),
  );
}

Center _buildLoadingIndicator() {
  return Center(
    child: new CircularProgressIndicator(),
  );
}

_goToClassDetails(BuildContext context, GymClass gymClass) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => GymClassDetails(gymClass)
    )
  );
}
