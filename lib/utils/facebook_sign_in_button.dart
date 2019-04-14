import 'package:flutter/material.dart';

class FacebookSignInButton extends StatelessWidget {
  FacebookSignInButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Image _buildLogo() {
      return Image.asset(
        "images/facebook.png",
        height: 18.0,
        width: 18.0,
      );
    }

    Opacity _buildText() {
      return Opacity(
        opacity: 0.7,
        child: Text(
          "Sign in with Facebook",
          style: TextStyle(
            fontFamily: 'Roboto-Medium',
            color: Colors.white,
          ),
        ),
      );
    }

    return MaterialButton(
      height: 40.0,
      onPressed: this.onPressed,
      color: Colors.indigo[600],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildLogo(),
          SizedBox(width: 10.0),
          _buildText(),
        ],
      ),
    );
  }
}