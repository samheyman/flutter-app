import 'package:flutter/material.dart';
import './bottom_navigation.dart';
import './pages/app_pages.dart';

class MamaFitClub extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MamaFitClubState();
}

class _MamaFitClubState extends State<MamaFitClub> {
  int _currentIndex = 0;
  final List<AppPage> _appPages = appPages;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mama Fit Club',
      home: Scaffold(
        appBar: AppBar(
          title: Text((appPages[_currentIndex]).pageTitle),
        ),
        body: _appPages[_currentIndex].pageWidget,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: bottomNavigationItems,
        ),
      ),
      theme: ThemeData(
        primaryColor: Colors.redAccent,
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

void main() {
  runApp(MaterialApp(
    title: 'Mama Fit Club',
    home: MamaFitClub(),
  ));
}
