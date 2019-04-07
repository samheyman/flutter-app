import 'package:flutter/material.dart';

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
        child: Text("Mama Fit Club",
          style: TextStyle(color: Colors.white, fontSize: 28),),
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
              MaterialButton(
                color: Colors.white,
                child: Text("Sign in with Google"),
                onPressed: () => print("Button pressed"),
              ),
              MaterialButton(
                color: Colors.white,
                child: Text("Sign in with Facebook"),
                onPressed: () => print("Button pressed"),
              ),
              SizedBox(
                height: 50,
              ),
              Text("I'll join later.",
                style: TextStyle(color: Colors.white) ,) 
            ],
          ),
        ),
      ),
      
    );
  }
}