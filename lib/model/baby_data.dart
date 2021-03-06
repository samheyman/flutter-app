
class BabyData {
  // final int daysOfDevelopment;
  // final double sizeCm;
  // final String fruitSize;
  // final double weightG;
  final DateTime dueDate;

  const BabyData(
    {
      // this.daysOfDevelopment,
      // this.sizeCm,
      // this.fruitSize,
      // this.weightG,
      this.dueDate,
    }
  );

  num get weeksElapsed {
    print("Calculating weeks ellapsed");
    if(dueDate != null) {
      var result = ((DateTime.now().add(Duration(days: 280)).difference(dueDate).inDays)/7).floor();
      print("Due date: " + dueDate.toString());
      print("Weeks ellapsed: " + result.toString());
      return result;
    } else {
      return -1;
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

  String get getTrimester {
    if (weeksElapsed < 14) {
      return "Trimester 1";
    } else if (weeksElapsed < 27) {
      return "Trimester 2";
    } else if (weeksElapsed < 41) {
      return "Trimester 3";
    } else if (weeksElapsed >= 41) {
      return "Baby born";
    } else {
      return "";
    }
  }
}