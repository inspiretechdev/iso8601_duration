///A class to show duration information
///
///Duration will be returned in Year Month Week Day Minute Hour Seconds format
class ISODuration {
  final num? year, month, week, day, minute, hour, seconds;
  const ISODuration({
    this.year = 0,
    this.month = 0,
    this.week = 0,
    this.day = 0,
    this.minute = 0,
    this.hour = 0,
    this.seconds = 0,
  });
  @override
  //Duration will be shown a text string
  String toString() {
    String duration = '';
    if (year != 0) {
      duration = '$duration $year year';
    }

    if (month != 0) {
      duration = '$duration $month month';
    }
    if (week != 0) {
      duration = '$duration $week week';
    }
    if (day != 0) {
      duration = '$duration $day day';
    }
    if (hour != 0) {
      duration = '$duration $hour hour';
    }
    if (minute != 0) {
      duration = '$duration $minute minute';
    }
    if (seconds != 0) {
      duration = '$duration $seconds seconds';
    }
    return duration;
  }
}
