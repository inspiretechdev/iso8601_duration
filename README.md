[![pub package](https://img.shields.io/pub/v/iso8601_duration)](https://img.shields.io/pub/v/iso8601_duration)

A Flutter package to parse ISO 8601 duration.

## Features

This package helps to parse ISO 8601 duration strings in either **PnW** or **PnYnMnDTnHnMnS** formats.

## Getting started

Please make sure the string is in ISO 8601 format. This plugin can parse strings in **PnW** or **PnYnMnDTnHnMnS** formats.

Explanation of each indicator is given below:

- **P** is the duration designator (for period) placed at the start of the duration representation.
- **Y** is the year designator that follows the value for the number of calendar years.
- **M** is the month designator that follows the value for the number of calendar months.
- **W** is the week designator that follows the value for the number of weeks.
- **D** is the day designator that follows the value for the number of calendar days.
- **T** is the time designator that precedes the time components of the representation.
- **H** is the hour designator that follows the value for the number of hours.
- **M** is the minute designator that follows the value for the number of minutes.
- **S** is the second designator that follows the value for the number of seconds.

## Usage

Here is an example of how to use the package:

```dart
import 'package:iso8601_duration/iso8601_duration.dart';

void main() {
  String durationToConvert = 'PT9H25M';
  final ISODurationConverter converter = ISODurationConverter();
  final ISODuration duration = converter.parseString(isoDurationString: durationToConvert);

  // Print the full duration as a human-readable string
  print(duration.toString()); // Output: "9 hour 25 minute"

  // Access individual fields
  print('Hours: ${duration.hour}'); // Output: 9
  print('Minutes: ${duration.minute}'); // Output: 25
  print('Seconds: ${duration.seconds}'); // Output: 0
}
```

### Fields Available in `ISODuration`

The `ISODuration` object provides the following fields, which you can access individually:

- **year**: The number of years in the duration.
- **month**: The number of months in the duration.
- **week**: The number of weeks in the duration.
- **day**: The number of days in the duration.
- **hour**: The number of hours in the duration.
- **minute**: The number of minutes in the duration.
- **seconds**: The number of seconds in the duration.

### Example with Full ISO 8601 Duration

```dart
String durationToConvert = 'P1Y2M3DT4H5M6S';
final ISODurationConverter converter = ISODurationConverter();
final ISODuration duration = converter.parseString(isoDurationString: durationToConvert);

print(duration.toString()); // Output: "1 year 2 month 3 day 4 hour 5 minute 6 seconds"

// Access individual fields
print('Years: ${duration.year}'); // Output: 1
print('Months: ${duration.month}'); // Output: 2
print('Days: ${duration.day}'); // Output: 3
print('Hours: ${duration.hour}'); // Output: 4
print('Minutes: ${duration.minute}'); // Output: 5
print('Seconds: ${duration.seconds}'); // Output: 6
```

### Notes

- If a component is not present in the ISO 8601 string, its value will default to `0`.
- The `toString()` method provides a human-readable representation of the duration.
