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


class ScheduleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScheduleWidgetState();
  }
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  StateModel appState;

  DefaultTabController _buildTabView({Widget body}) {

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
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
        print("Gym class found");
        // Use snapshots of all recipes if recipeType has not been passed
        stream = collectionReference.snapshots();
      }
      print(stream);

      // Define query depeneding on passed args
                  print('Documents: ');

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
                  return ListView(
                    children: snapshot.data.documents
                        // Check if the argument ids contains document ID if ids has been passed:
                        .where((d) => ids == null || ids.contains(d.documentID))
                        .map((document) {
                          // print(snapshot.data.documents[0]['created_date'].toString());
                      return new GymClassCard(
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
        _buildGymClasses(
          startDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
          endDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days:3650))),
        _buildGymClasses(
          endDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days:0)),
          startDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days:3650))),
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