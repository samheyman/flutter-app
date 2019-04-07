import 'package:flutter/material.dart';

ThemeData buildTheme() {
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontSize: 40.0,
        color: Colors.white,
      ),
    );
  }

  // We want to override a default light blue theme.
  final ThemeData base = ThemeData.light();
  
  // And apply changes on it:
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
  );
}