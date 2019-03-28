import 'package:flutter/material.dart';
import './utils/mama_fit_club_icons.dart';


final bottomNavigationItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home')
    ),
    BottomNavigationBarItem(
      icon: Icon(MyIcons.stretch),
      title: Text('Classes')
    ),
    BottomNavigationBarItem(
      icon: Icon(MyIcons.bookings),
      title: Text('Schedule')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.pregnant_woman),
      title: Text('Profile')
    ),  
  ];