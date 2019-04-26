import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/mama_fit_club_icons.dart';
import '../../model/state.dart';
import '../../state_widget.dart';
import '../../data/user_info.dart';

class EditDueDate extends StatefulWidget {

  final DateTime dueDate;
  EditDueDate(this.dueDate); 
  
  @override
  State<StatefulWidget> createState() {
    return _EditDueDateState();
  }
}

class _EditDueDateState extends State<EditDueDate> {
  StateModel appState;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: appState.dueDate,
        firstDate: DateTime(2017, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != widget.dueDate) {
      _saveDueDate(picked);
    }
  }

  void _saveDueDate(DateTime date) {
    print("Updating due date: " + date.toString() + " for user " + appState.user.uid.toString());
    updateUserDueDate(appState.user.uid, date).then((result) {
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

    Center _buildLoadingIndicator() {
      return Center(
        child: new CircularProgressIndicator(),
      );
    } 

    if (appState.isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Edit due date'),
        ),
        body: _buildLoadingIndicator(),
      );
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Edit due date'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal:30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("What is your due date?", style: TextStyle(fontSize: 16),),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.white,
                onPressed: () => _selectDate(context),
                child: Container(
                  padding: EdgeInsets.all(10),
                  // width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(DateFormat('MMMM dd, yyyy').format(appState.dueDate).toString(),
                        style: TextStyle(color: Colors.grey[700], fontSize: 20),),
                      Icon(MyIcons.bookings, size: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              RaisedButton(
                color: Colors.blue,
                onPressed: ()=> {
                  Navigator.pop(context),
                },
                child: Text("Back",
                  style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ), 
      );
    }
  }
}

