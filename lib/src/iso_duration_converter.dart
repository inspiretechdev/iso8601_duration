import 'package:flutter/foundation.dart';
import 'package:iso8601_duration/src/duration.dart';

/// A parser for ISO8601 duration.
///
///
/// String to parse must be in either PnYnMnDTnHnMnS or PnW format.
///
/// Parsed result will be returned in [ISODuration] format.
class ISODurationConverter {
  parseString({required String isoDurationString}) {
    //Check if string has extra characters
    void _validation(String isoDurationString) {
      RegExp exp = RegExp(r'\W');
      var match = exp.hasMatch(isoDurationString);
      if (kDebugMode) {
        debugPrint('RegExp test result : $match');
      }
    }

    _validation(isoDurationString);

    late int start;
    num year = 0, month = 0, week = 0, day = 0, min = 0, hour = 0, seconds = 0;
    /*---------------------------------------------------------------------------
    //Extracts the duration from string using position identifier
    --------------------------------------------------------------------------- */
    _getDuration(int start, int durationPosition) {
      try {
        return num.parse(isoDurationString.substring(start, durationPosition));
      } catch (e) {
        throw Exception(e);
      }
    }

    /*---------------------------------------------------------------------------
    //Identify duration positions
    --------------------------------------------------------------------------- */
    int periodPos = isoDurationString.indexOf('P');
    int yearPos = isoDurationString.indexOf('Y', periodPos);
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
      year = _getDuration(1, yearPos);
    }
    //Month
    if (!periodPos.isNegative && !monthPos.isNegative) {
      start = yearPos.isNegative ? periodPos + 1 : yearPos + 1;
      month = _getDuration(start, monthPos);
    }
    //Week
    if (!periodPos.isNegative && !weekPos.isNegative) {
      start = monthPos.isNegative
          ? yearPos.isNegative
              ? periodPos + 1
              : yearPos + 1
          : monthPos + 1;
      week = _getDuration(start, weekPos);
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
      day = _getDuration(start, dayPos);
    }
    //Hour
    if (!timePos.isNegative && !hourPos.isNegative) {
      start = timePos + 1;
      hour = _getDuration(start, hourPos);
    }
    //Minute
    if (!timePos.isNegative && !minutePos.isNegative) {
      start = hourPos.isNegative ? timePos + 1 : hourPos + 1;
      min = _getDuration(start, minutePos);
    }
    //Seconds
    if (!timePos.isNegative && !secondsPos.isNegative) {
      start = minutePos.isNegative
          ? hourPos.isNegative
              ? timePos + 1
              : hourPos + 1
          : minutePos + 1;
      seconds = _getDuration(start, secondsPos);
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
