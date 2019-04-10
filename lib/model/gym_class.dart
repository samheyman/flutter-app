// import 'package:duration/duration.dart';

enum GymClassType {
  aerobic,
  strength,
  yoga,
  pilates,
}

class GymClass {
  final String id;
  final DateTime created_date;
  final GymClassType type;
  final DateTime date_time;
  final int duration;
  final String class_name;
  final String gym_name;
  final String address;
  final int places;
  final double price;
  final List<String> details;
  final String source_url;
  final String image_url;

  GymClass.fromMap(Map<String, dynamic> data, String id)
    : this(
      id: id,   
      created_date: DateTime.fromMicrosecondsSinceEpoch((data['created_date'].microsecondsSinceEpoch)),
      date_time: DateTime.fromMicrosecondsSinceEpoch((data['date_time'].microsecondsSinceEpoch)),
      type: data['type'],
      duration: data['duration'],
      class_name: data['class_name'],
      gym_name: data['gym_name'],
      address: data['address'],
      places: data['places'],
      price: data['price'].toDouble(),
      details: List<String>.from(data['details']),
      source_url: data['source_url'],
      image_url: data['image_url'],
    );

  const GymClass(
    {
      this.id,
      this.created_date,
      this.date_time,
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