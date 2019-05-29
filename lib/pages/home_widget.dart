import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../bottom_navigation.dart';
import '../model/baby_data.dart';
import '../utils/helper_functions.dart';
import '../pages/pregnancy_tip_page.dart';
import '../pages/profile_widget.dart';
import './widgets/animated_chart.dart';
import '../model/state.dart';
import '../state_widget.dart';
import './app_pages.dart';
import './widgets/upcoming_gym_class_card.dart';
import './widgets/recommended_gym_class_card.dart';

TextStyle sectionHeaderStyle() {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: Colors.grey[800],
  );
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {

  StateModel appState;
  BabyData babyData;
  int _currentIndex = 0;
  final List<AppPage> _appPages = appPages;

  String getBabyFruitSize() {
    String fruit;
    if (babyData.weeksElapsed <5 ) return 'a poppy seed';
    if (babyData.weeksElapsed == 5) return 'an apple seed';
    if (babyData.weeksElapsed == 6) return 'a sweet pea';
    if (babyData.weeksElapsed == 7) return 'a blueberry';
    if (babyData.weeksElapsed == 8) return 'a rasberry';
    if (babyData.weeksElapsed == 9) return 'a cherry';
    if (babyData.weeksElapsed == 10) return 'a raddish';
    if (babyData.weeksElapsed == 11) return 'a strawberry';
    if (babyData.weeksElapsed == 12) return 'a chili pepper';
    if (babyData.weeksElapsed == 13) return 'a lime';
    if (babyData.weeksElapsed == 14) return 'a plum';
    if (babyData.weeksElapsed == 15) return 'a kiwi';
    if (babyData.weeksElapsed == 16) return 'a lemon';
    if (babyData.weeksElapsed == 17) return 'a peach';
    if (babyData.weeksElapsed == 18) return 'an onion';
    if (babyData.weeksElapsed == 19) return 'a tomato';
    if (babyData.weeksElapsed == 20) return 'an apple';
    if (babyData.weeksElapsed == 21) return 'an avocado';
    if (babyData.weeksElapsed == 22) return 'a pear'; 
    if (babyData.weeksElapsed == 23) return 'a pomegranate';
    if (babyData.weeksElapsed == 24) return 'a papaya';
    if (babyData.weeksElapsed == 25) return 'a bel pepper';
    if (babyData.weeksElapsed == 26) return 'a broccoli';
    if (babyData.weeksElapsed == 27) return 'a carrot';
    if (babyData.weeksElapsed == 28) return 'a grapefruit';
    if (babyData.weeksElapsed == 29) return 'a grapes';
    if (babyData.weeksElapsed == 30) return 'a corncob';
    if (babyData.weeksElapsed == 31) return 'a turnip';
    if (babyData.weeksElapsed == 32) return 'a coconut';
    if (babyData.weeksElapsed == 33) return 'an egg plant';
    if (babyData.weeksElapsed == 34) return 'a cabbage';
    if (babyData.weeksElapsed == 35) return 'a lettuce';
    if (babyData.weeksElapsed == 36) return 'a leek';
    if (babyData.weeksElapsed == 37) return 'a butter nutsquash';
    if (babyData.weeksElapsed == 38) return 'a pineapple';
    if (babyData.weeksElapsed == 39) return 'a watermelon';
    if (babyData.weeksElapsed == 40) return 'a pumpkin';
    if (babyData.weeksElapsed > 40) return 'a baby';
    return 'a baby';
  }
  
  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    babyData = BabyData(dueDate: appState.dueDate);
    
    Column _pieChartInterior(babyDetails) {
      if (babyDetails.weeksElapsed < 0) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text( 
                  'We\ndon\'t know\nyour\ndue date',
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.red[700], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
          ],
        );
      } else if (babyDetails.weeksElapsed > 40) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text( 
                  (babyDetails.weeksElapsed - 40).toString(),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.red[700], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 42,
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: 
                (babyDetails.weeksElapsed > 1) ? 
                Text( 
                  "weeks old".toUpperCase(),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.grey[800], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                )
                :
                Text( 
                  "week old".toUpperCase(),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.grey[800], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Icon(Icons.child_friendly, color: Colors.purpleAccent,),
          ],
        );
      }  else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text( 
                  babyDetails.weeksElapsed.toString(),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.red[700], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 42,
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: 
                (babyDetails.weeksElapsed > 1) ? 
                Text( 
                  "weeks today".toUpperCase(),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.grey[800], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                )
                :
                Text( 
                  "week today".toUpperCase(),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.grey[800], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text( 
                  getRemainingWeeksString(babyDetails),
                  style: Theme.of(context).textTheme.display1.copyWith(
                    color: Colors.grey[800], 
                    fontWeight: FontWeight.normal, 
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
          ],
        );
      }
    }

    Container _myDates(BabyData babyDetails) {
      return Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _pieChartInterior(babyDetails),
          ],
        ),
      );
    }

    Stack progressPieChart = Stack(
      children: <Widget>[
        _myDates(babyData),
        SizedBox(
          height: 150,
          width: 150,
          child: AnimatedPieChart(
            ellapsedWeeks: babyData.weeksElapsed.toDouble(), 
            remainingWeeks: babyData.weeksLeft.toDouble(),
          ),
        )
      ],
    );

    Stack _headerHero = Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background_image.jpg"),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(top:30, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(babyData.getTrimester , style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),
              Container(
                margin: EdgeInsets.only(top:30),
                padding: EdgeInsets.only(left: 0),
                child: progressPieChart,
              ),
            ],
          ),
        ),
      ],
    );
    
    Card _myBabyDetails() {
      return Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network('https://raw.githubusercontent.com/samheyman/flutter-app/master/images/' + getBabyFruitSize().split(' ')[1]+ '.png', height: 50),
                      Padding(
                        padding: EdgeInsets.only(left:30),
                        child: 
                          Text("Your baby is about the size of \n " + getBabyFruitSize(),
                            style: 
                              TextStyle(
                                fontSize: 13
                              ),
                              textAlign: TextAlign.start,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

    Container _myUpcomingClasses() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        color: Colors.transparent,
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Text('Upcoming classes'.toUpperCase(), 
                style: sectionHeaderStyle()),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(vertical:5, horizontal: 0),
              // shape: BeveledRectangleBorder(
              //     borderRadius: BorderRadius.circular(3),
              //   ),
              child: Column(
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                // padding: EdgeInsets.symmetric(vertical:0, horizontal: 0),
                children: [
                  // UpcomingGymClassCard(),
                  ListTile(title: Text("You have no upcoming classes", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),)
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // children: <Widget>[
                    // Text("You have no upcoming classes.",
                    //   style: 
                    //     TextStyle(
                    //       fontSize: 13,
                    //       color: Colors.grey[600],
                    //     ),
                    //     textAlign: TextAlign.start,
                    //   ),
                    
                    // Padding(
                    //   padding: EdgeInsets.only(top: 10),
                    // ),
                    
                ],
              ),
            ),
          ],
        ),
      );
    }

    Container _myRecommendedClasses() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        color: Colors.transparent,
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Text('Recommended classes'.toUpperCase(), 
                style: sectionHeaderStyle()),
            ),  
            Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(vertical:5, horizontal: 0),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RecommendedGymClassCard(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    _getBodyContent() {
      if (_currentIndex!=0) {
        return _appPages[_currentIndex].pageWidget;
      } else {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Mamma Fit Club'),
            actions: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileWidget(),
                      )
                    )
                  },
                  child: Icon(Icons.settings),
                ),
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
          // margin: const EdgeInsets.all(0),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 0,),
              _headerHero,
              (babyData.weeksElapsed > 0 && babyData.weeksElapsed < 41) ? _myBabyDetails() : SizedBox(height: 0,),
              _myUpcomingClasses(),
              _myRecommendedClasses(),
              _buildFitnessTips(context),
              // myNutritionTips(),  
            ],
          ),
        );
      }
    }
  
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _getBodyContent(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: bottomNavigationItems, 
      ),
    );
  }
}

Widget _buildFitnessTips(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('pregnancyTips').where("category", isEqualTo: "fitness").snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      // print(snapshot.data.documents.length);
      return _myFitnessTips(context, snapshot.data.documents);
    },
  ); 
}

Widget _myFitnessTips(BuildContext context, List documents) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    // color: Colors.white,
    child: Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(0),
          child: Text('DAILY TIPS'.toUpperCase(), 
            style: sectionHeaderStyle()),
        ),
        Column(
          children:
            documents.map((element) => Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Container(
                child: _makeTipContainer(context, element),
              ),
            ),
            ).toList(),
        ),
      ],
    ),
  );
}

Widget _makeTipContainer(BuildContext context, DocumentSnapshot pregnancyTip) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey[200],
          width: 1,
        ),
      ),
    ),
    // color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    height: 130,
    child: GestureDetector(
      onTap: () {
        _goToTipPage(context, pregnancyTip);
      },
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(pregnancyTip['image_url'], 
              fit: BoxFit.cover,
              height: 130,),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      (pregnancyTip['category']).toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 10),  
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      (pregnancyTip['title'].toString() + "\n"),
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        // Icon(Icons.trip_origin),
                        Text(pregnancyTip['source'],
                        style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

_goToTipPage(BuildContext context, pregnancyTip) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PregnancyTipPage(pregnancyTip)
    )
  );
}