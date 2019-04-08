  import 'package:flutter/material.dart';
  import 'package:scoped_model/scoped_model.dart';
  import './bottom_navigation.dart';
  import './pages/app_pages.dart';
  import './model/bookings_model.dart';
  import './utils/theme.dart';
  import './pages/login.dart';
  import './pages/classes_widget.dart';
  import './pages/home_widget.dart';

  void main() => runApp(
    Login(),
  );

  class Login extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Mama Fit Club',
        initialRoute: '/login',
        routes: {
          '/': (context) => MamaFitClub(),
          '/homepage': (context) => MamaFitClub(),
          '/login': (context) => LoginScreen(),
        },
        theme: buildTheme(),
      );
    }
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
        theme: buildTheme(),
      );
    }

    // Simple function to handle the bottom naviation  
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
