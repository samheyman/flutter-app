import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../data/gym_classes.dart';
import '../model/gym_class.dart';
import '../utils/theme.dart';
import './widgets/gym_class_card.dart';
import './gym_class_details.dart';

class ClassesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _ClassesWidgetState();
  }
}

class _ClassesWidgetState extends State<ClassesWidget> {
  List<GymClass> gymClasses = getGymClasses();
  List<String> userFavorites = getFavoritesIDs();

  void _handleFavoritesListChanged(String recipeID) {
    // Set new state and refresh the widget:
    setState(() {
      if (userFavorites.contains(recipeID)) {
        userFavorites.remove(recipeID);
      } else {
        userFavorites.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Column _buildGymClasses(List<GymClass> gymClassList) {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: gymClassList.length,
              itemBuilder: (BuildContext context, int index) {
                return GymClassCard(
                  gymClass: gymClassList[index],
                  inFavorites: userFavorites.contains(gymClassList[index].id),
                  onFavoritesButtonPressed: _handleFavoritesListChanged,);
              },
            ),
          ),
        ],
      );
    }

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
          padding: EdgeInsets.all(0.0),
          child: TabBarView(
            // Replace placeholders:
            children: [
              // Display recipes of type food:
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().day)
                  .toList()),
              // Display recipes of type drink:
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().add(Duration(days:1)).day)
                  .toList()),
              // Display favorite recipes:
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().add(Duration(days:2)).day)
                  .toList()),
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().add(Duration(days:3)).day)
                  .toList()),
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().add(Duration(days:4)).day)
                  .toList()),
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().add(Duration(days:5)).day)
                  .toList()),
              _buildGymClasses(gymClasses
                  .where((gymClass) => gymClass.dateTime.day == DateTime.now().add(Duration(days:6)).day)
                  .toList()),
              // Center(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
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

_goToClassDetails(BuildContext context, GymClass gymClass) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => GymClassDetails(gymClass)
    )
  );
}
