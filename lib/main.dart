import 'package:flutter/material.dart';
import './pages/login.dart';
import './bottom_navigation.dart';
import './pages/app_pages.dart';

void main() => runApp(
  MamaFitClub(),
);

class MamaFitClub extends StatelessWidget {
  int _currentIndex = 0;
  final List<AppPage> _appPages = appPages;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      title: 'Mama Fit Club',
      // home: Scaffold(
      //   backgroundColor: Colors.red[50],
      //   appBar: AppBar(
      //     title: Text((appPages[_currentIndex]).pageTitle),
      //   ),
      //   // body: HomeWidget('Mama Fit Club')
      //   // // bottomNavigationBar: BottomNavigationBar(
      //   // //   type: BottomNavigationBarType.fixed,
      //   // //   currentIndex: _currentIndex,
      //   // //   // onTap: {},
      //   // //   items: bottomNavigationItems,
      //   // // ),
      // ),
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }

  // Simple function to handle the bottom naviation  
  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
}
