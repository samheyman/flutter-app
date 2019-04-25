
class BabyData {
  final int daysOfDevelopment;
  final double sizeCm;
  final String fruitSize;
  final double weightG;
  final DateTime dueDate;

  const BabyData(
    {
      this.daysOfDevelopment,
      this.sizeCm,
      this.fruitSize,
      this.weightG,
      this.dueDate,
    }
  );

  num get weeksElapsed {
    if(dueDate != null) {
      var result = ((DateTime.now().add(Duration(days: 280)).difference(dueDate).inDays)/7).floor();
      print("Due date: " + dueDate.toString());
      print("Weeks ellapsed: " + result.toString() );
      return result;
    // } else if(dueDate != null) {
    //   startDate = firstDayLastPeriod.add;
    //   return ((DateTime.now().difference(startDate).inDays)/7).floor();
    } else {
      return 0;
    }
  }

  num get daysElapsed {
    return ((DateTime.now().add(Duration(days: 280)).difference(dueDate).inDays)).floor();
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