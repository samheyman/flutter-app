import 'package:flutter/material.dart';

class FacebookSignInButton extends StatelessWidget {
  FacebookSignInButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Image _buildLogo() {
      return Image.asset(
        "images/facebook-logo.png",
        height: 34.0,
        // width: 18.0,
      );
    }

    Opacity _buildText() {
      return Opacity(
        opacity: 1,
        child: Text(
          "Continue with Facebook",
          style: TextStyle(
            fontFamily: 'Roboto-Medium',
            color: Colors.white,
          ),
        ),
      );
    }

    return MaterialButton(
      padding: EdgeInsets.only(left: 3, top: 3, right: 20, bottom: 3),
      height: 40.0,
      onPressed: this.onPressed,
      color: Color.fromRGBO(73, 103, 175, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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