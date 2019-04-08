// import 'package:duration/duration.dart';

enum GymClassType {
  aerobic,
  strength,
  yoga,
  pilates,
}

class GymClass {
  final String id;
  final GymClassType type;
  final DateTime dateTime;
  final int duration;
  final String name;
  final String location;
  final int places;
  final double price;
  final List<String> details;

  // GymClass.fromMap(Map<String, dynamic> map, {this.date}, {this.name}, {this.location})
  //    : assert(map['name'] != null),
  //      assert(map['location'] != null),
  //      name = map['name'],
  //      location = map['location'],
  //      duration = map['duration'],
  //      date = map['date'],
  //      ;

  const GymClass(
    {
      this.id,
      this.dateTime,
      this.type,
      this.duration,
      this.name,
      this.location,
      this.places,
      this.price,
      this.details,
    }
  );
}