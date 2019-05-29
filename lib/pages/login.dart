import 'package:flutter/material.dart';
import '../utils/google_sign_in_button.dart';
import '../utils/facebook_sign_in_button.dart';
import '../state_widget.dart';
import '../utils/mama_fit_club_icons.dart';
import '../model/state.dart';

class LoginScreen extends StatelessWidget {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    print("loading login screen");
    appState = StateWidget.of(context).state;

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

    Container _logo() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/gestantes.png', height: 170,),
            SizedBox(width: 10,),
            Text("Mamma\n  Fit\nClub".toUpperCase(),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline, 
            ),
          ],
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _logo(),
              SizedBox(height: 60,),
              Text("To continue please",
                style: TextStyle(color: Colors.white),),
              SizedBox(height: 30,),
              GoogleSignInButton( // New code
                      onPressed: () => 
                        StateWidget.of(context).signInWithGoogle(), // New code
                    ),
              SizedBox(height: 10,),
              Text("or", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              FacebookSignInButton( 
                // child: Image.asset('images/facebook-login.png'),// New code
                onPressed: () => {
                  print("Clicked sign in with Facebook"),
                  StateWidget.of(context).signInWithFacebook(),} // New code
              ),
                            
              SizedBox(
                height: 150,
              ),
              // Text(data)
              // GestureDetector(
              //   onTap: () => Navigator.of(context).pushReplacementNamed('/homepage'),
              //   child: Text("No login",
              //     style: TextStyle(color: Colors.white) ,) ,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}