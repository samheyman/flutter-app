import 'package:firebase_auth/firebase_auth.dart';
import './user_profile.dart';

class StateModel {
  bool isLoading;
  bool loginRequired;
  FirebaseUser user;
  List<String> bookedClasses;
  FitnessLevel fitnessLevel;
  DateTime firstDayLastPeriod;
  DateTime dueDate;

  StateModel({
    this.isLoading = false,
    this.loginRequired = true,
    this.user 
  });
}

// = Object({
//       "displayName": "Sam Heyman", 
//       "uid": "PbcHUF6qo0VsITF8rdBDxiy9VD33", 
//       "email": "sam.heyman@gmail.com",
//     }),