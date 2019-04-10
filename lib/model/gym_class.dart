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
  final String class_name;
  final String gym_name;
  final String address;
  final int places;
  final double price;
  final List<String> details;
  final String source_url;
  final String image_url;

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
      this.class_name,
      this.gym_name,
      this.address,
      this.places,
      this.price,
      this.details,
      this.source_url,
      this.image_url,
    }
  );
}