import 'package:iso8601_duration/src/constants.dart';
import 'package:iso8601_duration/src/duration.dart';

/// A parser for ISO 8601 duration strings.
///
/// This class provides functionality to parse strings in the ISO 8601 duration format
/// (e.g., `PnYnMnDTnHnMnS` or `PnW`) and convert them into an [ISODuration] object.
///
/// Example usage:
/// ```dart
/// final converter = ISODurationConverter();
/// final duration = converter.parseString(isoDurationString: 'P1Y2M3DT4H5M6S');
/// print(duration); // Outputs: "1 year 2 months 3 days 4 hours 5 minutes 6 seconds"
/// ```
class ISODurationConverter {
  ///Parse the string in PnYnMnDTnHnMnS or PnW format and returns the result in ISODuration format.

  ISODuration parseString({required String isoDurationString}) {
    void validateISO8601String(String isoDurationString) {
      if (isoDurationString.isEmpty) {
        throw FormatException(isoDurationEmptyError);
      }
      if (!isoDurationString.startsWith('P')) {
        throw FormatException(isoDurationInvalidStartError);
      }
      if (isoDurationString.contains(RegExp(invalidCharacterRegex))) {
        throw FormatException(isoDurationInvalidCharacterError);
      }
    }

    validateISO8601String(isoDurationString);
    late int start;
    num year = 0, month = 0, week = 0, day = 0, min = 0, hour = 0, seconds = 0;

    ///Extracts the duration from string using position identifier
    num extractDuration(int start, int durationPosition) {
      try {
        return num.parse(isoDurationString.substring(start, durationPosition));
      } catch (e) {
        throw FormatException('$isoDurationParsingError - $e');
      }
    }

    //Get the position of the character in the string
    ///Returns the position of the character in the string
    ///If the character is not found, it returns -1
    int getPosition(String isoDurationString, String char, {int start = 0}) {
      return isoDurationString.indexOf(char, start);
    }

    //Identify duration positions
    int periodPos = isoDurationString.indexOf('P');
    int yearPos = getPosition(isoDurationString, 'Y',
        start: periodPos); // isoDurationString.indexOf('Y', periodPos);
    int weekPos = isoDurationString.indexOf('W');
    int dayPos = isoDurationString.indexOf('D');
    int timePos = isoDurationString.indexOf('T');
    int hourPos =
        isoDurationString.indexOf('H', timePos.isNegative ? 0 : timePos);
    int minutePos =
        isoDurationString.indexOf('M', timePos.isNegative ? 0 : timePos);
    int monthPos = 0;
    if (minutePos.isNegative) {
      monthPos = isoDurationString.indexOf('M', 0);
    } else if (!minutePos.isNegative) {
      monthPos = isoDurationString.indexOf('M', 0);
      if (minutePos == monthPos) {
        monthPos = -1;
      }
    }
    int secondsPos =
        isoDurationString.indexOf('S', timePos.isNegative ? 0 : timePos);

    //Year
    if (!yearPos.isNegative && !periodPos.isNegative) {
      year = extractDuration(1, yearPos);
    }
    //Month
    if (!periodPos.isNegative && !monthPos.isNegative) {
      start = yearPos.isNegative ? periodPos + 1 : yearPos + 1;
      month = extractDuration(start, monthPos);
    }
    //Week
    if (!periodPos.isNegative && !weekPos.isNegative) {
      start = monthPos.isNegative
          ? yearPos.isNegative
              ? periodPos + 1
              : yearPos + 1
          : monthPos + 1;
      week = extractDuration(start, weekPos);
    }
    //Day
    if (!periodPos.isNegative && !dayPos.isNegative) {
      start = weekPos.isNegative //yes
          ? monthPos.isNegative
              ? yearPos.isNegative
                  ? periodPos + 1
                  : yearPos + 1
              : monthPos + 1
          : weekPos + 1;
      day = extractDuration(start, dayPos);
    }
    //Hour
    if (!timePos.isNegative && !hourPos.isNegative) {
      start = timePos + 1;
      hour = extractDuration(start, hourPos);
    }
    //Minute
    if (!timePos.isNegative && !minutePos.isNegative) {
      start = hourPos.isNegative ? timePos + 1 : hourPos + 1;
      min = extractDuration(start, minutePos);
    }
    //Seconds
    if (!timePos.isNegative && !secondsPos.isNegative) {
      start = minutePos.isNegative
          ? hourPos.isNegative
              ? timePos + 1
              : hourPos + 1
          : minutePos + 1;
      seconds = extractDuration(start, secondsPos);
    }

    return ISODuration(
      year: year,
      month: month,
      week: week,
      day: day,
      hour: hour,
      minute: min,
      seconds: seconds,
    );
  }
}
