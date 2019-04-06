import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Colors.grey[600],
    );
  }

  Container myDates(BabyData babyDetails) {
    return Container(
      margin: EdgeInsets.only(top:140),
      width: 150.0,
      height: 150.0,
      decoration: new BoxDecoration(
        color: Colors.red[50],
        shape: BoxShape.circle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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

  Container myBaby(babyDetails) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    padding: EdgeInsets.all(0),
    child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.white,
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
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex:2,
                  child: Text("You have no upcoming classes.",
                    style: 
                      TextStyle(
                        fontSize: 13
                      ),
                      textAlign: TextAlign.start,
                    ),
                ),
                Expanded(
                  flex:1,
                  child: RaisedButton(
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text(
                          " Search ", 
                          style: TextStyle( 
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MamaFitClub()),
                      // );
                    },
                    color: Colors.red[300],
                    textColor: Colors.white,
                    elevation: 1,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container makeTipContainer(pregnancyTip) {
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
              child: Image.asset('images/' + pregnancyTip.image, height: 130, fit: BoxFit.cover,),
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
                        (pregnancyTip.category).toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 10),  
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        (pregnancyTip.name.toString() + "\n"),
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
                          Text(pregnancyTip.source,
                          style: TextStyle(fontSize: 10),
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

  Container myFitnessTips() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Column(
              children: <Widget>[
                makeTipContainer(getPregnancyTips()[6]),
                makeTipContainer(getPregnancyTips()[4]),
                makeTipContainer(getPregnancyTips()[5]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container myNutritionTips() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // color: Colors.white,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Text('Nutrition tips'.toUpperCase(), 
              style: sectionHeaderStyle()),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Column(
              children: <Widget>[
                makeTipContainer(getPregnancyTips()[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final headerContent = Stack(
    children: [
      Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/exercise.jpg"),
            fit: BoxFit.cover,
          ),
        )
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          myDates(getBabyData()),
        ],
      ),
    ],
  );

  return Scaffold(
    backgroundColor: Colors.grey[200],
    appBar: AppBar(
      backgroundColor: Colors.red[400],
      elevation: 2,
      title: Text("Mama Fit Club"),
    ),
    body: Container(
      margin: const EdgeInsets.all(0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          headerContent,
          myBaby(getBabyData()),
          myClasses(),
          myFitnessTips(),
          myNutritionTips(),  
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
    PregnancyTip(
      name: "Women who exercise during pregnancy are less likely to develop gestational diabetes",
      category: "Fitness",
      source: "Independant.ie",
      image: 'exercise.jpg',
      content: "Women who exercise during pregnancy are around a third less likely to develop gestational diabetes, and put on less weight - even if they normally do little or none, a study has found."
        + "Gestational diabetes is a common pregnancy complication with up to 18 in every 100 women giving birth in Britain affected, although it is more prevalent in obese women."
        + "It is associated with an increased risk of serious disorders such as pre-eclampsia, hypertension, pre-term birth, along with induced or Caesarean births and can also have long-term effects on the mother, including impaired glucose tolerance and type 2 diabetes."
        + "The children of mothers with gestational diabetes are also more likely to become overweight or obese and have a higher risk of developing diabetes themselves. "
        + "\n\nResults\n"
        + "The Spanish study looked at the results of enrolling healthy pregnant women who did little or no exercise into exercise programmes."
        + "Analysis of 13 trials, involving more than 2,800 women, found that exercise reduced the risk of gestational diabetes by more than 30pc, while for women who exercised throughout pregnancy this was even greater at 36pc."
        + "This effect was strongest for women who combined toning, strength, flexibility and aerobic exercise.),",
    ),
    PregnancyTip(
      name: "Fitness Ball Squats",
      category: "Fitness",
      source: "mayoclinic.org",
      image: 'fitness_ball_squats.jpg',
      content: "Squatting during labor — even for short amounts of time — helps open your pelvic outlet and allows more room for your baby to descend. Practicing squats now will make it easier to squat during labor. Try squats with a fitness ball."
        + "\n\n- Stand up straight with a fitness ball behind your back and against the wall, your feet about shoulder-width apart."
        + "\n- Slide down the wall until your knees reach a 90-degree angle, being careful to keep your heels flat on the floor. If you can't bend your knees to a 90-degree angle, simply go as low as you can then return to the starting position."
        + "\n\nYou might want to have someone stand next to you to prevent you from losing your balance. Gradually work up to 10 repetitions."
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

