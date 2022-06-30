import 'package:flutter_test/flutter_test.dart';

import 'package:iso8601_duration/iso8601_duration.dart';

void main() {
  test('adds one to input values', () {
    expect(
        ISODurationConverter().parseString(isoDurationString: 'P3Y6M4DT5S'),
        const ISODuration(
          year: 3,
          month: 6,
          week: 0,
          day: 4,
          hour: 0,
          minute: 0,
          seconds: 5,
        ));
  });
}
