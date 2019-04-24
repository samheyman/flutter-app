import 'package:flutter/material.dart';
import './utils/mama_fit_club_icons.dart';


final bottomNavigationItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.pregnant_woman),
      title: Text('Guide')
    ),
    BottomNavigationBarItem(
      icon: Icon(MyIcons.stretch),
      title: Text('Classes')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('Favorites')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('Profile')
    ),  
  ];