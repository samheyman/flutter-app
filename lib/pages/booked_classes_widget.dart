import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../data/gym_classes.dart';
import '../model/gym_class.dart';
import '../utils/theme.dart';
import './widgets/booked_gym_class_card.dart';
import './gym_class_details.dart';
import '../model/state.dart';
import '../state_widget.dart';
import '../pages/login.dart';
import '../pages/profile_widget.dart';


class BookedClassesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookedClassesWidgetState();
  }
}

class _BookedClassesWidgetState extends State<BookedClassesWidget> {
  StateModel appState;

  void _handleBookedClassesChanged(String gymID) {
    updateBookedClasses(appState.user.uid, gymID).then((result) {
      // Update the state:
      if (result == true) {
        setState(() {
          if (!appState.bookedClasses.contains(gymID))
            appState.bookedClasses.add(gymID);
          else
            appState.bookedClasses.remove(gymID);
        });
      }
    });
  }

  DefaultTabController _buildTabView({Widget body}) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookings'),
          actions: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(),
                      )
                    )
                  },
                  child: Icon(Icons.settings),
                ),
                padding: EdgeInsets.all(10),
              ),
            ],
          bottom: TabBar(
            isScrollable: false,
            labelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            labelPadding: EdgeInsets.all(10),
            tabs: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  "Upcoming",
                ),
                ],
              ),
              Column(
                children: [
                  Text(
                  "Past",
                ),
                ],
              ),
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
    Padding _buildGymClasses({DateTime startDate, DateTime endDate, List<String> ids}) {
      CollectionReference collectionReference =
          Firestore.instance.collection('gymClasses');
      Stream<QuerySnapshot> stream;
      // The argument recipeType is set
      if (startDate != null && endDate != null) {
        stream = collectionReference 
            .where("date_time", isLessThan: endDate)
            .where("date_time", isGreaterThanOrEqualTo: startDate)
            .snapshots();
      } else {
        // Use snapshots of all recipes if recipeType has not been passed
        stream = collectionReference.snapshots();
      }
      // Define query depeneding on passed args
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: stream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return _buildLoadingIndicator();
                  print("Displaying favorite classes: " + appState.bookedClasses.toString());
                  print("List of ids : " + ids.toString());
                  return ListView(
                    children: snapshot.data.documents
                        // Check if the argument ids contains document ID if ids has been passed:
                        .where((d) => ids != null && ids.contains(d.documentID))
                        .map((document) {
                          // print(ids);
                          print("Gym class ID: " + document.documentID.toString());
                          return BookedGymClassCard(
                            gymClass:
                                GymClass.fromMap(document.data, document.documentID),
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
        _buildGymClasses(
          startDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
          endDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days:3650)),
          ids: appState.bookedClasses,
        ),
        _buildGymClasses(
          endDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days:0)),
          startDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days:3650)),
          ids: appState.bookedClasses,
        ),
      ],
    );
  }
  
  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildTabView(
        body: _buildLoadingIndicator(),
      );
    } else {
      return _buildTabView(
        body: _buildTabsContent(),
      );
    }
  }

  Widget _buildTab(int daysFromNow) {
    String day = 'today';
    if (daysFromNow != 0) {
      day = DateFormat('E').format(DateTime.now().add(Duration(days: daysFromNow))).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }
}