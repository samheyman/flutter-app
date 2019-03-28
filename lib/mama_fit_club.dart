import 'package:flutter/material.dart';

import './pages/home_widget.dart';
import './pages/classes_widget.dart';
import './pages/schedule_widget.dart';
import './pages/profile_widget.dart';
import './bottom_navigation.dart';

class MamaFitClub extends StatefulWidget {
  MamaFitClub({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MamaFitClub();
  }
}

class _MamaFitClub extends State<MamaFitClub> {
  int _currentPage = 0;
  final List<Widget> _appPages= [
    HomeWidget(),
    ClassesWidget(),
    ScheduleWidget(),
    ProfileWidget(),
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
        items: bottomNavigationItems,
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

