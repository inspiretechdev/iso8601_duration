///A class to show duration information
///
///Duration will be returned in Year Month Week Day Minute Hour Seconds format
///This class is used to represent a duration in a human-readable format.
///It provides a way to specify the duration in terms of years, months, weeks,
///days, hours, minutes, and seconds.
///The class has a constructor that allows you to specify the values for each
///component of the duration.
///The class also has a toString method that converts the duration into a
///human-readable string format.
class ISODuration {
  // Fields representing different components of the duration.
  final num? year, month, week, day, minute, hour, seconds;

  /// Constructor to initialize the duration components.
  /// Defaults to 0 for all components if not provided.
  /// [year] - Number of years in the duration.
  /// [month] - Number of months in the duration.
  /// [week] - Number of weeks in the duration.
  /// [day] - Number of days in the duration.
  /// [hour] - Number of hours in the duration.
  /// [minute] - Number of minutes in the duration.
  /// [seconds] - Number of seconds in the duration.
  /// The constructor takes named parameters for each component of the duration.
  /// Each parameter has a default value of 0, so if a component is not specified,
  /// it will be set to 0.
  /// This allows for creating an instance of ISODuration with only the components
  /// that are relevant to the specific duration being represented.
  /// For example, if you only want to represent a duration of 2 days and 3 hours,
  /// you can create an instance like this:
  /// ```dart
  /// ISODuration(year: 0, month: 0, week: 0, day: 2, hour: 3);
  /// ```
  /// This will create an ISODuration object representing a duration of 2 days and 3 hours,
  /// with all other components (year, month, week, minute, seconds) set to 0.
  /// This constructor is useful for creating instances of ISODuration with specific
  /// values for each component, allowing for flexibility in representing different
  /// durations.
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ISODuration) return false;
    return year == other.year &&
        month == other.month &&
        week == other.week &&
        day == other.day &&
        hour == other.hour &&
        minute == other.minute &&
        seconds == other.seconds;
  }

  @override
  int get hashCode =>
      Object.hash(year, month, week, day, hour, minute, seconds);

  /// Converts the duration into a human-readable string format.
  @override
  String toString() {
    String duration = '';

    // Add year to the duration string if it's not 0.
    if (year != 0) {
      duration = '$duration $year year';
    }

    // Add month to the duration string if it's not 0.
    if (month != 0) {
      duration = '$duration $month month';
    }

    // Add week to the duration string if it's not 0.
    if (week != 0) {
      duration = '$duration $week week';
    }

    // Add day to the duration string if it's not 0.
    if (day != 0) {
      duration = '$duration $day day';
    }

    // Add hour to the duration string if it's not 0.
    if (hour != 0) {
      duration = '$duration $hour hour';
    }

    // Add minute to the duration string if it's not 0.
    if (minute != 0) {
      duration = '$duration $minute minute';
    }

    // Add seconds to the duration string if it's not 0.
    // This is the last component, so we don't need to check for 0.
    if (seconds != 0) {
      duration = '$duration $seconds seconds';
    }
    // Return the final duration string.
    return duration;
  }
}
