  import 'package:flutter/material.dart';
  import 'package:scoped_model/scoped_model.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';

  import './state_widget.dart';
  import './bottom_navigation.dart';
  import './pages/app_pages.dart';
  import './model/state.dart';
  import './utils/theme.dart';
  import './pages/login.dart';
  import './pages/classes_widget.dart';
  import './pages/home_widget.dart';
  import './pages/loading_page.dart';
  import './pages/root_screen.dart';

  void main() {
    Firestore.instance.settings(timestampsInSnapshotsEnabled: true);
    //Get shared preferences here and pass down to app
    StateWidget stateWidget = StateWidget(child: MamaFitClub());
    runApp(stateWidget);
  }

  class MamaFitClub extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      print("Building the Mama Fit Club widget");
      return MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Mama Fit Club',
        routes: {
          '/': (context) => RootScreen(),
          '/root': (context) => RootScreen(),
          '/login': (context) => LoginScreen(),
          '/signUp': (context) => LoginScreen(),
          '/homepage': (context) => HomeWidget(),
        },
        theme: buildTheme(),
        // home: RootScreen(),
      );
    }
  }


// use this to show walkthrough, otherwise no need
  Widget _handleCurrentScreen() {
    return LoginScreen();    
  }


  // class _MamaFitClubState extends State<MamaFitClub> {
  //   StateModel appState;
  //   int _currentIndex = 0;
  //   final List<AppPage> _appPages = appPages;
    
  //   Center _buildLoadingIndicator() {
  //     return Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   }

  //   @override
  //   Widget build(BuildContext context) {
  //     appState = StateWidget.of(context).state;
  //     print("App loading? " + appState.isLoading.toString());
  //     print("User: " + appState.user.toString());
  //     print("Current index: " + _currentIndex.toString());
  //     if (appState.isLoading) {
  //       print("Showing loading page");
  //       return LoadingScreen();
  //     } else if (!appState.isLoading && appState.user == null && appState.loginRequired) {
  //       _currentIndex = 0;
  //       return LoginScreen();
  //     } else {
  //       return MaterialApp(
  //         home: Scaffold(
  //           backgroundColor: Theme.of(context).accentColor,
  //           body: _appPages[_currentIndex].pageWidget,
  //           bottomNavigationBar: BottomNavigationBar(
  //             type: BottomNavigationBarType.fixed,
  //             currentIndex: _currentIndex,
  //             onTap: onTabTapped,
  //             items: bottomNavigationItems,
              
  //           ),
  //         ),
  //         theme: buildTheme(),
  //       );
  //     }
  //   }

  //   // Simple function to handle the bottom naviation  
  //   void onTabTapped(int index) {
  //     setState(() {
  //       _currentIndex = index;
  //     });
  //   }
  // }
