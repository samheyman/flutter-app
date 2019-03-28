import 'package:flutter/material.dart';
import './bottom_navigation.dart';
import './pages/app_pages.dart';

class MamaFitClub extends StatefulWidget {
  MamaFitClub({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MamaFitClub();
  }
}

class _MamaFitClub extends State<MamaFitClub> {
  int _currentIndex = 0;
  final List<Widget> _appPages = appPages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mama Fit Club'),
      ),
      body: _appPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: bottomNavigationItems,
      ),
    );
  }

  // Simple function to handle the bottom naviation  
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

