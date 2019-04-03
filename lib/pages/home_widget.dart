import 'package:flutter/material.dart';
import '../model/pregnancy_tip.dart';
import '../model/user_profile.dart';
import '../model/baby_data.dart';
import '../utils/helper_functions.dart';
import '../pages/pregnancy_tip_page.dart';

class HomeWidget extends StatelessWidget {
  
 @override
 Widget build(BuildContext context) {

  _goToTipPage(BuildContext context, PregnancyTip pregnancyTip) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) => PregnancyTipPage(pregnancyTip)
      )
    );
  }

  TextStyle sectionHeaderStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.grey[600],
    );
  }

  Container myPregnancy(BabyData babyDetails) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.transparent,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Text('Today', 
              style: sectionHeaderStyle()),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("You're " +
              getElapsedTimeString(babyDetails) + " in, " + getRemainingTimeString(babyDetails),
            style: Theme.of(context).textTheme.display1.copyWith(
              color: Colors.grey[500], fontWeight: FontWeight.bold, fontSize: 14, height: 1.5)),
          ),
          Container(
            color: Colors.white,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/lemon.png', height: 70),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Your baby is \nthe size of a " + babyDetails.fruitSize
                              + "\n(" + babyDetails.sizeCm.toString() + "cm, " + babyDetails.weightG.toString() + "g)",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Container myClasses() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      color: Colors.transparent,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Text('My classes', 
              style: sectionHeaderStyle()),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("You have completed 0 classes. ",
            style: Theme.of(context).textTheme.display1.copyWith(
              color: Colors.grey[500], fontWeight: FontWeight.bold, fontSize: 14, height: 1.5)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Find your next class", style: TextStyle(fontWeight: FontWeight.bold),),
                // onPressed: ()=> {},
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MamaFitClub()),
                  // );
                },
                color: Colors.greenAccent[100],
                textColor: Colors.green,
                elevation: 1,
                shape: SuperellipseShape(),
          ),
            ],
          ),
        ],
      ),
    );
  }

  Container makeTipContainer(pregnancyTip) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: 130,
      child: GestureDetector(
        onTap: () {
          _goToTipPage(context, pregnancyTip);
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset('images/' + pregnancyTip.image, height: 130, fit: BoxFit.cover,),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        (pregnancyTip.category).toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14),  
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        (pregnancyTip.name.toString() + "\n"),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          // Icon(Icons.trip_origin),
                          Text(pregnancyTip.source,
                          style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // FlatButton(
                    //   child: Text("Read more"),
                    //   color: Colors.lightBlue,
                    //   textColor: Colors.white,
                    //   onPressed: () {
                    //     _goToTipPage(context, pregnancyTip);
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container myTips() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.transparent,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Text('Daily tips', 
              style: sectionHeaderStyle()),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Column(
              children: <Widget>[
                makeTipContainer(getPregnancyTips()[3]),
                makeTipContainer(getPregnancyTips()[1]),
                makeTipContainer(getPregnancyTips()[4]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  return Center(
    child: Container(
      margin: const EdgeInsets.all(5),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          myPregnancy(getBabyData()),
          myClasses(),
          myTips(),
        ],
      ),
    ),
  );
 }
}

List<PregnancyTip> getPregnancyTips() {
  return([
    PregnancyTip(
      name: 'Benefits of exercise',
      content: 'Reduced back pain:  2 out of 3 women experience back pain during pregnancy, but strength training for your lower body and core will help combat it.',
      category: 'Exercise',
      source: 'Baby2Body',
      image: 'yoga.jpg',
    ),
    PregnancyTip(
      name: 'Magnesium',
      content: 'If you’re not getting enough of this essential mineral in your diet, you could be more prone to stress – as a mom or mom-to-be, getting help in the stress-reduction space is always welcome.',
      category: 'Nutrition',
      source: 'Baby2Body',
      image: 'magnesium.jpg'
    ),
    PregnancyTip(
      name: 'Level of fitness',
      content: 'If you exercised regularly at a high-intensity , your body will be used to that and you can continue to work out to a similar intensity, especially in the early weeks of pregnancy. If you never really worked out before pregnancy, be sure to ease into it with gentle exercise and build as you become stronger. As you move through pregnancy, you may want to make adjustments, which brings us to our next rule.',
      category: 'Exercise',
      source: 'Baby2Body',
      image: 'yoga.jpg',
    ),
    PregnancyTip(
      name: 'Cardio for pregnancy',
      content: "Jogging/ running - You may find it too uncomfortable as baby grows, but running during pregnancy is OK! You’ll probably want to slow your pace or shorten distance over time - just remember to listen to your body and warm up before starting.",
      category: 'Cardio',
      source: 'Baby2Body',
      image: 'cardio.jpg',
    ),
    PregnancyTip(
      name: 'Yoga and Pregnancy',
      content: "Yoga is a very good way to stay active during pregnancy, despite lack of energy, aching joints and extra belly weight. It offers many health benefits, including improved breathing, relaxation and stress relief. Attending classes geared towards pregnant women is a very good way to meet other women going through the same thing as you." 
      + "\nMake sure to take the following precautions however:"
      + "\n- you should avoid headstands, handstands, upward bow pose etc without support"
      + "\n- poses done while lying on your back aren't recommended after the first trimester"
      + "\nPregnancy yoga classes will of course take this into consideration but you should talk to your doctor beforehand to make sure you get the go-ahead.",
      category: 'Yoga',
      source: 'Pregnancy+',
      image: 'yoga.jpg',
    ),
  ]);
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

BabyData getBabyData() {
  return BabyData(
    firstDayLastPeriod: DateTime.parse('2018-12-23'),
    daysOfDevelopment: 92,
    sizeCm:  2.5,
    fruitSize: "lemon",
    weightG: 3,
  );
}

