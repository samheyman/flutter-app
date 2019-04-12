import 'package:flutter/material.dart';
import '../utils/google_sign_in_button.dart';
import '../state_widget.dart';
import '../utils/mama_fit_club_icons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    BoxDecoration _buildBackground() {
      return BoxDecoration(
        color: Colors.redAccent,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color(0xffff5252).withOpacity(0.0),
            Color(0xff0069ff).withOpacity(0.8),
          ],
        ),
      );
    }

    Container _logo() {
      return Container(
        child: Column(
          children: [
            Icon(Icons.pregnant_woman, size: 42),
            Text("Mama\nFit Club",
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _logo(),
              SizedBox(height: 50,),
              GoogleSignInButton( // New code
                onPressed: () => 
                  StateWidget.of(context).signInWithGoogle(), // New code
              ),
              MaterialButton(
                color: Colors.white,
                child: Text("Sign in with Facebook"),
                onPressed: () => print("Button pressed"),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushReplacementNamed('/homepage'),
                child: Text("No thank you, I'll join later.",
                  style: TextStyle(color: Colors.white) ,) ,
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}