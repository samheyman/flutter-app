import '../model/gym_class.dart';

List<GymClass> getGymClasses() {
  return [
    GymClass(
      id: '0',
      dateTime: DateTime.now(),
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
    GymClass(
      id: '4',
      dateTime: DateTime.now(),
      type: GymClassType.strength,
      duration: 60,
      name: 'Core Strengthening',
      location: 'Fitness Chicks',
      places: 2,
      price: 300,
      details: [
        'This is the first paragraph',
        'And this is the second paragraph',
        'More info',
      ]
    ),
    GymClass(
      id: '1',
      dateTime: DateTime.now().add(Duration(days: 1)),
      type: GymClassType.aerobic,
      duration: 90,
      name: 'Outdoor HIIT',
      location: 'Park',
      places: 5,
      price: 340,
      details: [
        'This is the first paragraph',
        'And this is the second paragraph',
        'More info',
      ]
    ),
    GymClass(
      id: '2',
      dateTime: DateTime.now().add(Duration(days: 2)),
      type: GymClassType.strength,
      duration: 60,
      name: 'Pre-natal Spinning',
      location: 'My health centre',
      places: 3,
      price: 100,
      details: [
        'This is the first paragraph',
        'And this is the second paragraph',
        'More info',
      ]
    ),
  ];
}

List<String> getFavoritesIDs() {
  return [
    '0',
    '2',
    '3',
  ];
}