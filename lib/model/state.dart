import 'package:firebase_auth/firebase_auth.dart';

class StateModel {
  bool isLoading;
  FirebaseUser user;
  List<String> savedClasses;

  StateModel({
    this.isLoading = false,
    this.user,
  });
}