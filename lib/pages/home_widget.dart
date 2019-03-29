import 'package:flutter/material.dart';
import '../model/pregnancy_tip.dart';

class HomeWidget extends StatelessWidget {

 @override
 Widget build(BuildContext context) {

  Container makeTipContainer(pregnancyTip) {
    return(
      Container( 
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(
               (pregnancyTip.category + " tip").toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10),  
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                (pregnancyTip.name.toString() + "\n").toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                pregnancyTip.content.toString(),
                style: TextStyle(),
              ),
            ),
            // ButtonTheme.bar( // make buttons use the appropriate styles for cards
            //   child: ButtonBar(
            //     children: <Widget>[
            //       FlatButton(
            //         child: const Text('READ MORE'),
            //         onPressed: () { /* ... */ },
            //       ),
            //     ],
            //   ),
            // ),
            // Card(
            //   elevation: 0,
            //   margin: EdgeInsets.only(top:10),
            //   child: Container(
            //     padding: EdgeInsets.all(20),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
                    
                    
                    
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      )
    );
  }

    final _headerContent = Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: Colors.transparent,
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
                padding: EdgeInsets.only(bottom: 10),
                child: Text('13 weeks, 1 day', 
              // textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16, height: 1.5)),
              ),
               // Text('Your baby is the size of a lemon.', 
              // // textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black, fontSize: 14, height: 2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Card(
                          shape: CircleBorder(side: BorderSide(width: 100)),
                          elevation: 2,
                          color: Colors.white,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              new Container(
                                width: 90.0,
                                height: 90.0,
                              ),
                              Image.asset('images/embryo_13.jpg', height: 40),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("2.5cm, 3g",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Card(
                          shape: CircleBorder(side: BorderSide(width: 300)),
                          elevation: 2,
                          color: Colors.white,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              new Container(
                                width: 110.0,
                                height: 110.0,
                              ),
                              Image.asset('images/lemon.png', height: 70),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Your baby is \nthe size of a lemon",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(  
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Card(
                          shape: CircleBorder(side: BorderSide(width: 300)),
                          elevation: 4,
                          color: Colors.white,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 90.0,
                                height: 90.0,
                              ),
                              Text(
                                "28 weeks\n5 days",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("to go",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    final _dailyExerciseTip = makeTipContainer(getPregnancyTips()[0]);

    final _dailyNutritionTip = makeTipContainer(getPregnancyTips()[1]);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        // color: Colors.white,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,    
          scrollDirection: Axis.vertical,
          children: [
            _headerContent,
            _dailyExerciseTip,
            _dailyNutritionTip,
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
    ),
    PregnancyTip(
      name: 'Magnesium',
      content: 'If you’re not getting enough of this essential mineral in your diet, you could be more prone to stress – as a mom or mom-to-be, getting help in the stress-reduction space is always welcome.',
      category: 'Nutrition',
      source: 'Baby2Body',
    ),
    PregnancyTip(
      name: 'Level of fitness',
      content: 'If you exercised regularly at a high-intensity , your body will be used to that and you can continue to work out to a similar intensity, especially in the early weeks of pregnancy. If you never really worked out before pregnancy, be sure to ease into it with gentle exercise and build as you become stronger. As you move through pregnancy, you may want to make adjustments, which brings us to our next rule.',
      category: 'Exercise',
      source: 'Baby2Body',
    ),
    PregnancyTip(
      name: 'Cardio exercises for pregnancy',
      content: "Jogging/ running - You may find it too uncomfortable as baby grows, but running during pregnancy is OK! You’ll probably want to slow your pace or shorten distance over time - just remember to listen to your body and warm up before starting.",
      category: 'Exercise',
      source: 'Baby2Body',
    ),
  ]);
} 