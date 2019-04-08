import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../model/pregnancy_tip.dart';
import '../model/user_profile.dart';
import '../model/baby_data.dart';
import '../utils/helper_functions.dart';
import '../pages/pregnancy_tip_page.dart';
import '../utils/animated_chart.dart';

BabyData getBabyData() {
  return BabyData(
    firstDayLastPeriod: DateTime.parse('2018-12-23'),
    daysOfDevelopment: 92,
    sizeCm:  2.5,
    fruitSize: "lemon",
    weightG: 3,
  );
}

TextStyle sectionHeaderStyle() {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.grey[600],
  );
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
 
  @override
  Widget build(BuildContext context) {
    
    Container myDates(BabyData babyDetails) {
      return Container(
        // margin: EdgeInsets.symmetric(vertical:40, horizontal:10),
        width: 150.0,
        height: 150.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text( 
                      getElapsedWeeksString(babyDetails),
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
                  child: Text( 
                      "weeks today".toUpperCase(),
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
                      getRemainingWeeksString(babyDetails) + " weeks to go",
                      style: Theme.of(context).textTheme.display1.copyWith(
                        color: Colors.grey[800], 
                        fontWeight: FontWeight.normal, 
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Stack progressPieChart = Stack(
      children: <Widget>[
        myDates(getBabyData()),
        SizedBox(
          height: 150,
          width: 150,
          child: AnimatedPieChart(),
        )
      ],
    );

    Stack headerContent = Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/exercise2.jpg"),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(top:90),
          padding: EdgeInsets.only(left: 20),
          child: progressPieChart,
        ),
      ],
    );
    
    Card myBaby(babyDetails) {
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
                      Image.asset('images/lemon.png', height: 50),
                      Padding(
                        padding: EdgeInsets.only(left:30),
                        child: Text("Your baby is about the size of \na " + babyDetails.fruitSize
                          + " (" + babyDetails.sizeCm.toString() + "cm and " + babyDetails.weightG.toString() + "g)",
                          style: 
                            TextStyle(
                              fontSize: 13
                            ),
                            textAlign: TextAlign.start,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

    Container myClasses() {
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
              child: Text('My classes'.toUpperCase(), 
                style: sectionHeaderStyle()),
            ),
            
            Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(vertical:5, horizontal: 0),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                padding: EdgeInsets.symmetric(vertical:20, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Text("You have no upcoming classes.",
                          style: 
                            TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    RaisedButton(
                      child: SizedBox(
                        width: 120,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text(
                            " Search classes", 
                            style: TextStyle( 
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => MamaFitClub()),
                        // );
                      },
                      color: Colors.purple[200],
                      textColor: Colors.white,
                      elevation: 1,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    // Container myNutritionTips() {
    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
    //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   // color: Colors.white,
    //   child: Column( 
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.all(0),
    //         child: Text('Nutrition tips'.toUpperCase(), 
    //           style: sectionHeaderStyle()),
    //       ),
    //       Container(
    //         color: Colors.white,
    //         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
    //         child: Column(
    //           children: <Widget>[
    //             makeTipContainer(getPregnancyTips()[1]),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  // }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("Mama Fit Club"),
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 0,),
            headerContent,
            // myBaby(getBabyData()),
            myClasses(),
            _buildFitnessTips(context),
            // myNutritionTips(),  
          ],
        ),
      ),
    );
  }
}

Widget _buildFitnessTips(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('pregnancyTips').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      print(snapshot.data.documents.length);
      return _myFitnessTips(context, snapshot.data.documents);
    },
  ); 
}

Widget _myFitnessTips(BuildContext context, List documents) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    // color: Colors.white,
    child: Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(0),
          child: Text('Fitness tips'.toUpperCase(), 
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
    new MaterialPageRoute(
      builder: (context) => PregnancyTipPage(pregnancyTip)
    )
  );
}

UserProfile getUserProfile() {
  return UserProfile(
    firstName: "Eline",
    lastName: "Lund",
    email: "email.com",
    dueDate: "2019-09-21",
    fitnessLevel: "Intermediate",
  );
}

// PregnancyTip(
//       name: 'Magnesium',
//       content: 'If you’re not getting enough of this essential mineral in your diet, you could be more prone to stress – as a mom or mom-to-be, getting help in the stress-reduction space is always welcome.',
//       category: 'Nutrition',
//       source: 'Baby2Body',
//       image: 'magnesium.jpg'
//     ),