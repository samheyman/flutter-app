import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../model/state.dart';
import '../data/user_info.dart';
import '../state_widget.dart';
import '../utils/mama_fit_club_icons.dart';

class GetUserInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GetUserInfoScreenState();
  }
}

class _GetUserInfoScreenState extends State<GetUserInfoScreen>{
  StateModel appState;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _saveDate(DateTime date) {
    print("Saving date: " + selectedDate.toString() + " for user " + appState.user.uid.toString());
    updateUserInfo(appState.user.uid, date).then((result) {
      // Update the state:
      if (result == true) {
        setState(() {
          appState.dueDate = date;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    // print("User: " + appState.user.uid.  toString());
    BoxDecoration _buildBackground() {
      return BoxDecoration(
        color: Colors.redAccent,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color(0xffff5252).withOpacity(0.0),
            Color(0xff0069ff).withOpacity(0.3),
          ],
        ),
      );
    }

    _getDate() {
      String date;
      if (selectedDate!=null) {
        date = "${DateFormat('dd/MM/yyyy').format(selectedDate)}";
      } else {
        date = "";
      }
      return Text(date, style: TextStyle(
        color: Colors.white,
        fontSize: 22));
    }

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        padding: EdgeInsets.all(60),
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text("Hello! ",
                // style: TextStyle(color: Colors.white),),
              SizedBox(height: 50,),
              Text("Let's make sure that the app is specific to your needs.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18), 
                  textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              Text("What is your due date?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18), 
                  textAlign: TextAlign.justify,), 
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: () => _selectDate(context),
                child: Container(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(DateFormat('MMMM dd, yyyy').format(selectedDate).toString(),
                        style: TextStyle(color: Colors.grey[00]),),
                      Icon(MyIcons.bookings),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              // _getDate(),
              SizedBox(height: 50.0,),
              RaisedButton(
                color: Colors.blueAccent[700],
                onPressed: () => {
                  // print("Saving date: " + selectedDate.toString()),
                  _saveDate(selectedDate),
                  StateWidget.of(context).saveDueDate(selectedDate),
                },
                child: Text("Get started".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)), 
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}