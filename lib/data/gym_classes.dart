import '../model/gym_class.dart';

List<GymClass> getGymClasses() {
  return [
    GymClass(
      id: '0',
      dateTime: DateTime.now().add(Duration(hours: 5)),
      type: GymClassType.yoga,
      duration: 60,
      name: 'Pre-natal yoga',
      location: 'My fitness studio',
      places: 3,
      price: 240,
      details: [
        'This is the first paragraph',
        'And this is the second paragraph',
        'More info',
      ]
    ),
  ];
}