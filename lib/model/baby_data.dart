
class BabyData {
  final int daysOfDevelopment;
  final double sizeCm;
  final String fruitSize;
  final double weightG;
  final DateTime firstDayLastPeriod;

  const BabyData(
    {
      this.daysOfDevelopment,
      this.sizeCm,
      this.fruitSize,
      this.weightG,
      this.firstDayLastPeriod,
    }
  );

  num get weeksElapsed {
    if(firstDayLastPeriod != null) {
      return ((DateTime.now().difference(firstDayLastPeriod).inDays)/7).floor();
    // } else if(dueDate != null) {
    //   startDate = firstDayLastPeriod.add;
    //   return ((DateTime.now().difference(startDate).inDays)/7).floor();
    } else {
      return 0;
    }
  }

  num get daysElapsed {
    return ((DateTime.now().difference(firstDayLastPeriod).inDays)).floor();
  }

  num get weeksLeft {
    return 40  - weeksElapsed;
  }

  num get daysLeft {
    return 280 - daysElapsed;
  }

  // DateTime get dueDate {
  //   return firstDayLastPeriod.add(Duration(days:280));
  // }
}