String getRemainingTimeString(babyData) {
  String daysOrDay = 'days';
  String weeksOrWeek = 'weeks';

  if (babyData.weeksLeft == 1) {
    weeksOrWeek = 'week';
  }

  if (babyData.daysLeft - babyData.weeksLeft*7 == 1) {
    daysOrDay = 'day';
  }
  
  return
    babyData.weeksLeft.toString() + ' ' + weeksOrWeek + ' and ' + 
    (babyData.daysLeft - babyData.weeksLeft*7).toString() + ' ' + daysOrDay + ' to go!';
}

String getElapsedTimeString(babyData) {
  String daysOrDay = 'days';
  String weeksOrWeek = 'weeks';

  if (babyData.weeksElapsed == 1) {
    weeksOrWeek = 'week';
  }

  if (babyData.weeksElapsed*7 - babyData.daysElapsed == 1) {
    daysOrDay = 'day';
  }
  
  return
    babyData.weeksElapsed.toString() + ' ' + weeksOrWeek + ' and ' + 
    (babyData.daysElapsed - babyData.weeksElapsed*7).toString() + ' ' + daysOrDay;
}

