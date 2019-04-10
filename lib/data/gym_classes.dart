import '../model/gym_class.dart';

List<GymClass> getGymClasses() {
  return [
    GymClass(
      id: '0',
      dateTime: DateTime.parse('2019-04-10 17:30'),
      type: GymClassType.yoga,
      duration: 90,
      class_name: 'Prenatal Yoga',
      gym_name: 'Baby Gruppen',
      address: 'Stureplan, Humlegårdsgatan 13 B',
      places: 3,
      price: 1795,
      details: [
        "Pregnancy is a wonderful time in a woman's life. During pregnancy the body goes through many changes and it is important to maintain physical activity for your health. Babygruppens Prenatal Yoga in Stockholm will prepare you both mentally and physically for the upcoming birth of your baby. Yoga during pregnancy will increases the well-being for both mother and baby. Our yoga has its roots in the Hathayoga tradition and has helped thousands of mothers in their birth preparation.",
      ],
      source_url: 'http://www.babygruppen.se/gravidyoga.php',
      image_url: 'http://www.babygruppen.se/upload/pictures/Sk%C3%A4rmavbild_2015-11-17_kl._11_.29_.32_2.png',
    ),
    
    GymClass(
      id: '2',
      dateTime: DateTime.parse('2019-04-13 10:30'),
      type: GymClassType.pilates,
      duration: 50,
      class_name: 'Pregnancy Pilates',
      gym_name: 'Vasastan',
      address: 'Surbrunnsgatan 60, Stockholm',
      places: 5,
      price: 320,
      image_url: 'https://pilatesvia.com/se/wp-content/uploads/pregancy-pilates-class-3840x2160-q30.jpg',
      details: [
        "Pregnancy Pilates is safe to perform during all three trimesters. Women are more prone to back pain and injury during this time due to a shift in center of gravity, carrying extra weight, and looser more unstable ligaments. Through controlled exercises, this gentle but effective method will help you to strengthen postural and pelvic floor muscles that will aid in labor and recovery!",
      ],
      source_url: 'https://pilatesvia.com/se/en/book/?tags[]=Pregnancy+Pilates+Classes',
    ),
    // GymClass(
    //   id: '2',
    //   dateTime: DateTime.now().add(Duration(days: 2)),
    //   type: GymClassType.strength,
    //   duration: 60,
    //   class_name: 'Pre-natal Spinning',
    //   gym_name: 'My health centre',
    //   address: '',
    //   places: 3,
    //   price: 100,
    //   details: [
    //     'This is the first paragraph',
    //     'And this is the second paragraph',
    //     'More info',
    //   ]
    // ),
  ];
}

List<String> getFavoritesIDs() {
  return [
    '0',
    '2',
    '3',
  ];
}