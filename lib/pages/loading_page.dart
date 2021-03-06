import 'package:flutter/material.dart';
import '../utils/mama_fit_club_icons.dart';

class LoadingScreen extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/gestantes.png', height: 60,),
            Text("Mama\nFit Club",
              textAlign: TextAlign.center,
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
            ],
          ),
        ),
      ),
    );
  }
}