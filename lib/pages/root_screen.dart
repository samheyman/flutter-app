import 'package:flutter/material.dart';
import './login.dart';
import './home_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/state.dart';
import '../state_widget.dart';
import './get_user_info.dart';
import './loading_page.dart';


class RootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    print("******** Opening root screen *********");
    appState = StateWidget.of(context).state;
    print("App loading? " + appState.isLoading.toString());
    print("User: " + appState.user.toString());
      // print("Current index: " + _currentIndex.toString());
    
    if (!appState.loginRequired) {
      print("No login required. Using fake user.");
      return HomeWidget();
    } else if (appState.isLoading && appState.user!=null) {
      print("Showing loading page");
      return LoadingScreen();
    } else if (appState.user == null) {
      print("No user, redirecting to Login Screen");
      // _currentIndex = 0;
      return LoginScreen();
    } else if (appState.dueDate == null || appState.fitnessLevel == null ) {
      // _currentIndex = 0;
      return GetUserInfoScreen();
    } else {
      return HomeWidget();
    }
  }
}