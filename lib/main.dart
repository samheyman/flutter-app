  import 'package:flutter/material.dart';
  import 'package:scoped_model/scoped_model.dart';
  
  import './state_widget.dart';
  import './bottom_navigation.dart';
  import './pages/app_pages.dart';
  import './model/state.dart';
  import './utils/theme.dart';
  import './pages/login.dart';
  import './pages/classes_widget.dart';
  import './pages/home_widget.dart';
  import './pages/loading_page.dart';

  void main() {
    StateWidget stateWidget = StateWidget(child: Initialize());
    runApp(stateWidget);
  }

  class Initialize extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Mama Fit Club',
        routes: {
          '/': (context) => MamaFitClub(),
          '/homepage': (context) => HomeWidget(),
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
    StateModel appState;
    int _currentIndex = 0;
    final List<AppPage> _appPages = appPages;
    
    Center _buildLoadingIndicator() {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    @override
    Widget build(BuildContext context) {
      appState = StateWidget.of(context).state;
      print("Current app state: " + appState.isLoading.toString());
      print("User: " + appState.user.toString());
      print("Current index: " + _currentIndex.toString());
      if (appState.isLoading) {
        print("Showing loading page");
        return LoadingScreen();
      } else if (!appState.isLoading && appState.user == null) {
        _currentIndex = 0;
        return LoginScreen();
      } else {
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Theme.of(context).accentColor,
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
    }

    // Simple function to handle the bottom naviation  
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
