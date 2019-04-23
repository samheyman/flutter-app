import 'package:flutter/material.dart';
import 'dart:async';
import '../model/state.dart';
import '../data/user_info.dart';
import '../state_widget.dart';

class GetUserInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GetUserInfoScreenState();
  }
}

class _GetUserInfoScreenState extends State<GetUserInfoScreen>{
  StateModel appState;

  DateTime selectedDate = null;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018, 8),
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
          appState.firstDayLastPeriod = date;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    print("User: " + appState.user.uid.toString());
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
        date = "${selectedDate.toLocal()}";
      } else {
        date = "--/--/----";
      }
      return Text(date, style: TextStyle(color: Colors.white,));
    }

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Hello! ",
                style: TextStyle(color: Colors.white),),
              SizedBox(height: 50,),
              Text("Let's customize the app with your due date to make sure it is specific to your needs.",
                style: TextStyle(color: Colors.white),),
              SizedBox(height: 30,),
              Text("When was the first day of your last period?",
                style: TextStyle(color: Colors.white),),  
              SizedBox(
                height: 30,
              ),
              _getDate(),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
              SizedBox(height: 50.0,),
              RaisedButton(
                color: Colors.blue,
                onPressed: () => {
                  // print("Saving date: " + selectedDate.toString()),
                  _saveDate(selectedDate),
                  Navigator.of(context).pushNamed('/homepage')
                },
                child: Text("Continue",
                  style: TextStyle(color: Colors.white) ,) ,
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}