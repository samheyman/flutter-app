import 'package:flutter/material.dart';

import '../../model/user_profile.dart';
import '../../model/state.dart';
import '../../state_widget.dart';
import '../../data/user_info.dart';

class EditFitnessLevel extends StatefulWidget {

  final FitnessLevel fitnessLevel;
  EditFitnessLevel(this.fitnessLevel); 
  
  @override
  State<StatefulWidget> createState() {
    return _EditFitnessLevelState();
  }
}

class _EditFitnessLevelState extends State<EditFitnessLevel> {
  StateModel appState;
  FitnessLevel selectedFitnessLevel;
  double _sliderValue = 0;

  void _saveFitnessLevel(int level) {
    print("Updating fitness level: " + level.toString() + " for user " + appState.user.uid.toString());
    updateUserFitnessLevel(appState.user.uid, level).then((result) {
      // Update the state:
      if (result == true) {
        setState(() {
          appState.fitnessLevel = FitnessLevel.values[level];
        });
        Navigator.pop(context);
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
          title: Text('Edit fitness level'),
        ),
        body: _buildLoadingIndicator(),
      );
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Edit fitness level'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal:30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("What is your fitness level?", style: TextStyle(fontSize: 16),),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Slider(
                      divisions: 2,
                      activeColor: Colors.indigoAccent,
                      min: 0.0,
                      max: 2.0,
                      onChanged: (newlevel) {
                        setState(() => {
                          _sliderValue = newlevel,
                          print("Level selected: " + _sliderValue.toString()),
                        }
                        );
                      },
                      value: _sliderValue,
                    ),

                  // This is the part that displays the value of the slider.
                  Container(
                    alignment: Alignment.center,
                    child: Text(FitnessLevel.values[_sliderValue.toInt()].toString().split('.')[1].toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[900] ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              RaisedButton(
                color: Colors.blue,
                onPressed: ()=> {
                  _saveFitnessLevel(_sliderValue.toInt()),
                },
                child: Text("Save",
                  style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ), 
      );
    }
  }
}

