import 'package:flutter/foundation.dart';
import 'package:iso8601_duration/src/duration.dart';

/// A parser for ISO8601 duration.
///
///
/// String to parse must be in either PnYnMnDTnHnMnS or PnW format.
///
/// Parsed result will be returned in [ISODuration] format.
class ISODurationConverter {
  ///Parse the string in PnYnMnDTnHnMnS or PnW format and returns the result in ISODuration format.
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
    late int _start;
    num _year = 0,
        _month = 0,
        _week = 0,
        _day = 0,
        _min = 0,
        _hour = 0,
        _seconds = 0;

    ///Extracts the duration from string using position identifier
    _getDuration(int start, int durationPosition) {
      try {
        return num.parse(isoDurationString.substring(start, durationPosition));
      } catch (e) {
        throw Exception(e);
      }
    }

    //Identify duration positions
    int _periodPos = isoDurationString.indexOf('P');
    int _yearPos = isoDurationString.indexOf('Y', _periodPos);
    int _weekPos = isoDurationString.indexOf('W');
    int _dayPos = isoDurationString.indexOf('D');
    int _timePos = isoDurationString.indexOf('T');
    int _hourPos =
        isoDurationString.indexOf('H', _timePos.isNegative ? 0 : _timePos);
    int _minutePos =
        isoDurationString.indexOf('M', _timePos.isNegative ? 0 : _timePos);
    int _monthPos = 0;
    if (_minutePos.isNegative) {
      _monthPos = isoDurationString.indexOf('M', 0);
    } else if (!_minutePos.isNegative) {
      _monthPos = isoDurationString.indexOf('M', 0);
      if (_minutePos == _monthPos) {
        _monthPos = -1;
      }
    }
    int _secondsPos =
        isoDurationString.indexOf('S', _timePos.isNegative ? 0 : _timePos);

    //Year
    if (!_yearPos.isNegative && !_periodPos.isNegative) {
      _year = _getDuration(1, _yearPos);
    }
    //Month
    if (!_periodPos.isNegative && !_monthPos.isNegative) {
      _start = _yearPos.isNegative ? _periodPos + 1 : _yearPos + 1;
      _month = _getDuration(_start, _monthPos);
    }
    //Week
    if (!_periodPos.isNegative && !_weekPos.isNegative) {
      _start = _monthPos.isNegative
          ? _yearPos.isNegative
              ? _periodPos + 1
              : _yearPos + 1
          : _monthPos + 1;
      _week = _getDuration(_start, _weekPos);
    }
    //Day
    if (!_periodPos.isNegative && !_dayPos.isNegative) {
      _start = _weekPos.isNegative //yes
          ? _monthPos.isNegative
              ? _yearPos.isNegative
                  ? _periodPos + 1
                  : _yearPos + 1
              : _monthPos + 1
          : _weekPos + 1;
      _day = _getDuration(_start, _dayPos);
    }
    //Hour
    if (!_timePos.isNegative && !_hourPos.isNegative) {
      _start = _timePos + 1;
      _hour = _getDuration(_start, _hourPos);
    }
    //Minute
    if (!_timePos.isNegative && !_minutePos.isNegative) {
      _start = _hourPos.isNegative ? _timePos + 1 : _hourPos + 1;
      _min = _getDuration(_start, _minutePos);
    }
    //Seconds
    if (!_timePos.isNegative && !_secondsPos.isNegative) {
      _start = _minutePos.isNegative
          ? _hourPos.isNegative
              ? _timePos + 1
              : _hourPos + 1
          : _minutePos + 1;
      _seconds = _getDuration(_start, _secondsPos);
    }

    return ISODuration(
      year: _year,
      month: _month,
      week: _week,
      day: _day,
      hour: _hour,
      minute: _min,
      seconds: _seconds,
    );
  }
}
