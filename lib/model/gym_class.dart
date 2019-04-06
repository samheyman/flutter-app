class GymClass {
  final String date;
  final String time;
  final int duration;
  final String name;
  final String location;
  final String category;
  final int places;
  final double price;

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
      this.date,
      this.time,
      this.duration,
      this.name,
      this.location,
      this.category,
      this.places,
      this.price,
    }
  );
}