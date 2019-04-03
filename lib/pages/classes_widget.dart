import 'package:flutter/material.dart';
import '../model/gym_class.dart';
import './gym_class_details.dart';

class ClassesWidget extends StatefulWidget {
  // ClassesWidget({Key key, this.title}) : super(key: key);
  // final String title = 'Classes';
  
  @override
  State<StatefulWidget> createState() {
      return _ClassesWidgetState();
    }
}

class _ClassesWidgetState extends State<ClassesWidget> {

  List <GymClass> _classes = getGymClasses();

  // @override
  // void initState() {
  //   _classes = getGymClasses();
  //   super.initState();
  // }

  // List<GymClass> _classes = [GymClass(
  //     time: '10:30', 
  //     date: '2019-04-10',
  //     duration: 60,
  //     name: 'Pre-natal yoga',
  //     location: 'My Gym'),];

  @override
  Widget build(BuildContext context) {
    return Classes(_classes);
  }
}

class Classes extends StatelessWidget{

  final List<GymClass> classes;
  Classes(this.classes);

  _goToClassDetails(BuildContext context, GymClass gymClass) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) => GymClassDetails(gymClass)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.only(top: 10),
    //   // padding: EdgeInsets.only(top:10),
    //   child: DefaultTabController(
    //     length: 7,
    //     initialIndex: 0,
    //     child: Column(
    //       children: <Widget>[
    //         TabBar(
    //           labelColor: Colors.black,
    //           isScrollable: true,
    //           tabs: [
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('TODAY'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('3',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Thu'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('4',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Fri'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('5',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Sat'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('6',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Sun'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('7',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Mon'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('8',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
    //             Tab(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('tue'.toUpperCase(),
    //                   style: dayTabStyle()),
    //                   Padding(padding: dayDateTabPadding(),),
    //                   Text('9',
    //                   style: dateTabStyle()),
    //                 ],
    //               ),
    //             ),
                
    //         ]),
            
    //       ],
    //     ),
    //   ),
    // );
    return ListView(
      scrollDirection: Axis.vertical,
      // class entry begins here: can be card or container
      children: 
        classes.map((element) => Card(
        // elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(164, 175, 196, .5)),
          child: makeClassBox(context, element),
        ),
      )).toList(),  
    );
  }

  ListTile makeClassBox(BuildContext context, GymClass gymClass) => ListTile(
    contentPadding:
        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Container(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
              gymClass.time,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, )),
            ),
            Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey, size: 14,),
                  Text(
                    " " + gymClass.duration.toString() + "min",
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
            ),
          ],
      ),
      ),
    ),
    title: Text(
      gymClass.name,
      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      gymClass.location,
      style: TextStyle(color: Colors.black54, fontSize: 12)
    ),
    onTap: () {
      _goToClassDetails(context, gymClass);
    },
  );
}


List <GymClass> getGymClasses() {
  return [
    GymClass(
      time: '10:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pre-natal yoga',
      location: 'My Gym', 
      category: 'yoga', 
      places: 2,
      price: 470,
    ),
    GymClass(
      time: '10:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Outdoor Pre-natal HIIT',
      location: 'Sport Centre', 
      category: 'cardio', 
      places: 1,
      price: 340,
    ),  
    GymClass(
      time: '15:00', 
      date: '2019-04-10',
      duration: 60,
      name: 'Spinning',
      location: 'My Gym', 
      category: 'cardio', 
      places: 5,
      price: 410,
    ),  
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports', 
      category: 'cardio', 
      price: 220,
    ),  
    GymClass(
      time: '21:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pilates',
      location: 'Fitness Chicks', 
      category: 'pilates', 
      places: 4,
      price: 330,
    ),  
    GymClass(
      time: '22:30', 
      date: '2019-04-10',
      duration: 30,
      name: 'Pre-natal yoga',
      location: 'My Gym', 
      category: 'yoga', 
      places: 2,
      price: 250,
    ), 
  ];
}

TextStyle dayTabStyle() {
  return TextStyle(
    fontSize: 10,
  );
}

TextStyle dateTabStyle() {
  return TextStyle(
    fontSize: 16,
  );
}

EdgeInsets dayDateTabPadding() {
  return EdgeInsets.only(top: 5);
}