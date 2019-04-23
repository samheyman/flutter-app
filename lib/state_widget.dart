import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './model/state.dart';
import './model/user_profile.dart';
import './utils/auth.dart';
import './pages/root_screen.dart';

class StateWidget extends StatefulWidget {
  final StateModel state;
  final Widget child;

  StateWidget({
    @required this.child,
    this.state,
  });

  // Returns data of the nearest widget _StateDataWidget
  // in the widget tree.
  static _StateWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_StateDataWidget)
            as _StateDataWidget)
        .data;
  }

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  StateModel state;
  GoogleSignInAccount googleAccount;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();
  FacebookLoginResult facebookLoginResult;

  @override
  void initState() {
    super.initState();
    print("Initialising state");
    if (widget.state != null) {
      state = widget.state;
    } else {
      print("Creating new State Model");
      state = StateModel(isLoading: true);
      // initUserGoogle();
      // initUserFacebook();
    }
  }

  Future<Null> initUserGoogle() async {
    googleAccount = await getGoogleSignedInAccount(googleSignIn);
    if (googleAccount == null) {
      setState(() {
        state.isLoading = false;
      });
    } else {
      await signInWithGoogle();
    }
  }

  Future<Null> initUserFacebook() async {
    print("Initialising Facebook user");
    facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);
    if (facebookLoginResult == null) {
      print("Facebook login result null");
      setState(() {
        state.isLoading = false;
      });
    } else {
      print("Facebook login result *not* null");    
      await signInWithFacebook();
    }
  }

  Future<List<String>> getSavedClasses() async {
    DocumentSnapshot querySnapshot = await Firestore.instance
        .collection('users')
        .document(state.user.uid)
        .get();
    if (querySnapshot.exists &&
        querySnapshot.data.containsKey('savedClasses') &&
        querySnapshot.data['savedClasses'] is List) {
      // Create a new List<String> from List<dynamic>
      return List<String>.from(querySnapshot.data['savedClasses']);
    }
    return [];
  }

  Future<DateTime> getFirstDayLastPeriod() async {
    DocumentSnapshot querySnapshot = await Firestore.instance
        .collection('users')
        .document(state.user.uid)
        .get();
    if (querySnapshot.exists &&
        querySnapshot.data.containsKey('firstDayLastPeriod') &&
        querySnapshot.data['firstDayLastPeriod'] != null) {
      // Create a new List<String> from List<dynamic>
      return DateTime.fromMicrosecondsSinceEpoch((querySnapshot.data['firstDayLastPeriod'].microsecondsSinceEpoch));
    }
    return DateTime(null);
  }

  Future<Null> signInWithFacebook() async {
    if (facebookLoginResult==null) {
      initUserFacebook();
    }
    print("Facebook login result is : " + facebookLoginResult.status.toString());
    if (facebookLoginResult.status != FacebookLoginStatus.loggedIn) {
      // Start the sign-in process:
      facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);
    }
    print("Signing in with Facebook. Status: " + facebookLoginResult.status.toString());
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.loggedIn:
        print("User logged in via Facebook.");
        FacebookAccessToken myToken = facebookLoginResult.accessToken;
        AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: myToken.token);
        state.user = await FirebaseAuth.instance.signInWithCredential(credential);
        List<String> savedClasses = await getSavedClasses();
        DateTime firstDayLastPeriod = await getFirstDayLastPeriod();
        print("First Date: " + state.firstDayLastPeriod.toString());
        setState(() {
          state.isLoading = false;
          print("Finished loading!");
          state.savedClasses = savedClasses;
          state.firstDayLastPeriod = firstDayLastPeriod;
        });
        
        break;
      case FacebookLoginStatus.cancelledByUser:
        setState(() {
          state.isLoading = false;
          state.user = null;
        });
        break;
      case FacebookLoginStatus.error:
        state.user = null;
        state.isLoading = false;
        print(facebookLoginResult.errorMessage);
        break;
    }
  }

  Future<Null> signOut() async {
    if (state.user!=null && state.user.providerData[0]!=null) {
      if (state.user.providerData[0].providerId == "facebook.com") {
        print("Signing out of Facebook");
        signOutOfFacebook();
      } else {
        print("Signing out of Google");
        signOutOfGoogle();
      }
    } else {
      print("Signing out");
      state.user = null;
      setState(() {
        state = StateModel(user: null);
      });
      // return RootScreen();
    }
  }

  Future<Null> signOutOfFacebook() async {
    await facebookLogin.logOut();
    state.user = null;
    setState(() {
      state = StateModel(user: null);
    });
  }

  Future<Null> signInWithGoogle() async {
    if (googleAccount == null) {
      // Start the sign-in process:
      googleAccount = await googleSignIn.signIn();
    }
    FirebaseUser firebaseUser = await signIntoFirebaseWithGoogle(googleAccount);
    state.user = firebaseUser; // new
    List<String> savedClasses = await getSavedClasses(); // new
    setState(() {
      state.isLoading = false;
      state.savedClasses = savedClasses; // new
    });
  }

  Future<Null> signOutOfGoogle() async {
    // Sign out from Firebase and Google
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    // Clear variables
    googleAccount = null;
    state.user = null;
    setState(() {
      state = StateModel(user: null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _StateDataWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _StateDataWidget extends InheritedWidget {
  final _StateWidgetState data;

  _StateDataWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  // Rebuild the widgets that inherit from this widget
  // on every rebuild of _StateDataWidget:
  @override
  bool updateShouldNotify(_StateDataWidget old) => true;
}