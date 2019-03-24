import 'package:flutter/material.dart';

import './mama_fit_club_icons.dart';
import './pages/dashboard_widget.dart';
import './pages/classes_widget.dart';
import './pages/schedule_widget.dart';
import './pages/profile_widget.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final List<Widget> _appPages= [
    DashboardWidget(Colors.white),
    ClassesWidget(Colors.deepOrange),
    ScheduleWidget(Colors.green),
    ProfileWidget(Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mama Fit Club'),
      ),
      body: _appPages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
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
        ],
      ),
    );
  }

  // Simple function to handle the bottom naviation  
  void onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}

