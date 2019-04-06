import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './bottom_navigation.dart';
import './pages/app_pages.dart';
import './model/bookings_model.dart';

void main() {
  final classBookings = BookingsModel();
  // connect to db here

  runApp(ScopedModel<BookingsModel>(

    // If you want to provide more than one model, you need to nest the ScopedModels:

    model: classBookings,
    child: MamaFitClub(),
  ));
}

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
        backgroundColor: Colors.red[50],
        // appBar: AppBar(
        //   title: Text((appPages[_currentIndex]).pageTitle),
        // ),
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
