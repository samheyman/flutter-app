import 'package:flutter/material.dart';
import '../classes.dart';
// import 'package:mama_fit_club/model/gym_class.dart';
import '../model/gym_class.dart';

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


List <GymClass> getGymClasses() {
  return [
    GymClass(
      time: '10:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pre-natal yoga',
      location: 'My Gym'),  
    GymClass(
      time: '10:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Outdoor Pre-natal HIIT',
      location: 'Sport Centre'),  
    GymClass(
      time: '15:00', 
      date: '2019-04-10',
      duration: 60,
      name: 'Spinning',
      location: 'My Gym'),  
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports'),  
    GymClass(
      time: '21:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pilates',
      location: 'Fitness Chicks'),  
    GymClass(
      time: '22:30', 
      date: '2019-04-10',
      duration: 30,
      name: 'Pre-natal yoga',
      location: 'My Gym'), 
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports'),  
    GymClass(
      time: '21:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pilates',
      location: 'Fitness Chicks'),  
    GymClass(
      time: '22:30', 
      date: '2019-04-10',
      duration: 30,
      name: 'Pre-natal yoga',
      location: 'My Gym'), 
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports'),  
    GymClass(
      time: '21:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pilates',
      location: 'Fitness Chicks'),  
    GymClass(
      time: '22:30', 
      date: '2019-04-10',
      duration: 30,
      name: 'Pre-natal yoga',
      location: 'My Gym'),  
    GymClass(
      time: '10:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pre-natal yoga',
      location: 'My Gym'),  
    GymClass(
      time: '10:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Outdoor Pre-natal HIIT',
      location: 'Sport Centre'),  
    GymClass(
      time: '15:00', 
      date: '2019-04-10',
      duration: 60,
      name: 'Spinning',
      location: 'My Gym'),  
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports'),  
    GymClass(
      time: '21:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pilates',
      location: 'Fitness Chicks'),  
    GymClass(
      time: '22:30', 
      date: '2019-04-10',
      duration: 30,
      name: 'Pre-natal yoga',
      location: 'My Gym'), 
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports'),  
    GymClass(
      time: '21:30', 
      date: '2019-04-10',
      duration: 60,
      name: 'Pilates',
      location: 'Fitness Chicks'),  
    GymClass(
      time: '22:30', 
      date: '2019-04-10',
      duration: 30,
      name: 'Pre-natal yoga',
      location: 'My Gym'), 
    GymClass(
      time: '19:30', 
      date: '2019-04-10',
      duration: 90,
      name: 'Cross training',
      location: 'Global Sports'),  
  ];
}