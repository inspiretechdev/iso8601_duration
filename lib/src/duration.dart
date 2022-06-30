///
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
  String toString() {
    String duration = '';
    year != 0 ? duration = '$duration $year year' : null;
    month != 0 ? duration = '$duration $month month' : null;
    week != 0 ? duration = '$duration $week week' : null;
    day != 0 ? duration = '$duration $day day' : null;
    hour != 0 ? duration = '$duration $hour hour' : null;
    minute != 0 ? duration = '$duration $minute minute' : null;
    seconds != 0 ? duration = '$duration $seconds seconds' : null;
    return duration;
  }
}
