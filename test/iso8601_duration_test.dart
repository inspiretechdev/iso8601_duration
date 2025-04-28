import 'package:flutter_test/flutter_test.dart';
import 'package:iso8601_duration/iso8601_duration.dart';

void main() {
  test('Check if parsing works correctly for full duration', () {
    ISODurationConverter converter = ISODurationConverter();
    var convertedString =
        converter.parseString(isoDurationString: 'P1Y2M3DT4H5M6S');
    expect(
        convertedString,
        const ISODuration(
          year: 1,
          month: 2,
          week: 0,
          day: 3,
          hour: 4,
          minute: 5,
          seconds: 6,
        ));
  });

  test('Check if parsing works for weeks only', () {
    ISODurationConverter converter = ISODurationConverter();
    var convertedString = converter.parseString(isoDurationString: 'P2W');
    expect(
        convertedString,
        const ISODuration(
          year: 0,
          month: 0,
          week: 2,
          day: 0,
          hour: 0,
          minute: 0,
          seconds: 0,
        ));
  });

  test('Check if parsing works for days only', () {
    ISODurationConverter converter = ISODurationConverter();
    var convertedString = converter.parseString(isoDurationString: 'P5D');
    expect(
        convertedString,
        const ISODuration(
          year: 0,
          month: 0,
          week: 0,
          day: 5,
          hour: 0,
          minute: 0,
          seconds: 0,
        ));
  });

  test('Check if parsing works for time only', () {
    ISODurationConverter converter = ISODurationConverter();
    var convertedString =
        converter.parseString(isoDurationString: 'PT3H15M45S');
    expect(
        convertedString,
        const ISODuration(
          year: 0,
          month: 0,
          week: 0,
          day: 0,
          hour: 3,
          minute: 15,
          seconds: 45,
        ));
  });

  test('Check if parsing works for mixed date and time', () {
    ISODurationConverter converter = ISODurationConverter();
    var convertedString =
        converter.parseString(isoDurationString: 'P1Y6M4DT12H30M');
    expect(
        convertedString,
        const ISODuration(
          year: 1,
          month: 6,
          week: 0,
          day: 4,
          hour: 12,
          minute: 30,
          seconds: 0,
        ));
  });

  test('Check if parsing works for empty duration', () {
    ISODurationConverter converter = ISODurationConverter();
    expect(() => converter.parseString(isoDurationString: ''),
        throwsA(isA<FormatException>()));
  });

  test('Check if parsing works for invalid format', () {
    ISODurationConverter converter = ISODurationConverter();
    expect(() => converter.parseString(isoDurationString: '1Y2M'),
        throwsA(isA<FormatException>()));
  });

  test('Check if parsing works for missing "P"', () {
    ISODurationConverter converter = ISODurationConverter();
    expect(() => converter.parseString(isoDurationString: '1Y2M3D'),
        throwsA(isA<FormatException>()));
  });

  test('Check if parsing works for missing "T" in time components', () {
    ISODurationConverter converter = ISODurationConverter();
    expect(() => converter.parseString(isoDurationString: 'P1Y2M3D4H5M'),
        throwsA(isA<FormatException>()));
  });
}
