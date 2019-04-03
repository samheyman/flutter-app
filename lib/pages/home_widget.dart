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
  
  Container makeTipContainer(pregnancyTip) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: 130,
      // //decoration: BoxDecoration(
      //   border: Border(top: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
      //   color: Colors.white,
      // ),
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

  Container makePageHeader(BabyData babyDetails) {
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.all(0),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column( 
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text('Trimester 1', 
                            style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  getElapsedTimeString(babyDetails),
              // textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16, height: 1.5)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  getRemainingTimeString(babyDetails),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: <Widget>[
                  //       Image.asset('images/embryo_13.jpg', height: 40),
                  //       // Card(
                  //       //   shape: CircleBorder(side: BorderSide(width: 100)),
                  //       //   elevation: 4,
                  //       //   color: Colors.white,
                  //       //   child: Stack(
                  //       //     alignment: AlignmentDirectional.center,
                  //       //     children: [
                  //       //       // new Container(
                  //       //       //   width: 90.0,
                  //       //       //   height: 90.0,
                  //       //       // ),
                  //       //       Image.asset('images/embryo_13.jpg', height: 40),
                  //       //     ],
                  //       //   ),
                  //       // ),
                  //       Padding(
                  //         padding: EdgeInsets.all(5),
                  //         child: Text(babyDetails.sizeCm.toString() + "cm, " + babyDetails.weightG.toString() + "g",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(fontSize: 10),),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/lemon.png', height: 70),
                        // Card(
                        //   shape: CircleBorder(side: BorderSide(width: 300)),
                        //   elevation: 2,
                        //   color: Colors.white,
                        //   child: Stack(
                        //     alignment: AlignmentDirectional.center,
                        //     children: [
                        //       // new Container(
                        //       //   color: Colors.transparent,
                        //       //   width: 110.0,
                        //       //   height: 110.0,
                        //       // ),
                        //       Image.asset('images/lemon.png', height: 70),
                        //     ],
                        //   ),
                        // ),
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
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(  
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: <Widget>[
                  //       Text(
                  //         getRemainingTimeString(babyDetails),
                  //         style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       // Card(
                  //       //   shape: CircleBorder(side: BorderSide(width: 300)),
                  //       //   elevation: 4,
                  //       //   color: Colors.white,
                  //       //   child: Stack(
                  //       //     alignment: AlignmentDirectional.center,
                  //       //     children: [
                  //       //       Container(
                  //       //         width: 90.0,
                  //       //         height: 90.0,
                  //       //       ),
                  //       //       Text(
                  //       //         getRemainingTimeString(babyDetails),
                  //       //         style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                  //       //         textAlign: TextAlign.center,
                  //       //       ),
                  //       //     ],
                  //       //   ),
                  //       // ),
                  //       Padding(
                  //         padding: EdgeInsets.all(5),
                  //         child: Text("to go",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(fontSize: 10),),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _pageHeader = makePageHeader(getBabyData());

  final _dailyExerciseTip1 = makeTipContainer(getPregnancyTips()[4]);
  final _dailyExerciseTip2 = makeTipContainer(getPregnancyTips()[3]);
  final _dailyNutritionTip = makeTipContainer(getPregnancyTips()[1]);

  return Center(
    child: Container(
      margin: const EdgeInsets.all(5),
      // color: Colors.white,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,    
        scrollDirection: Axis.vertical,
        children: [
          _pageHeader,
          _dailyExerciseTip1,
          _dailyNutritionTip,
          _dailyExerciseTip2,
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

