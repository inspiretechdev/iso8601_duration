[![pub package](https://img.shields.io/pub/v/iso8601_duration)](https://img.shields.io/pub/v/iso8601_duration)
A flutter package to parse ISO 8601 duration.

## Features

This package helps to parse ISO 8601 duration strings in either **PnW** or **PnYnMnDTnHnMnS** formats. 

## Getting started

Please make sure the string is in ISO 8601 format. This plug in can parse strings in **PnW** or **PnYnMnDTnHnMnS** formats.

Explanation on each of the indicator is given below.

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

```dart
String durationToConvert='PT9H25M';
final ISODurationConverter converter= ISODurationConverter();
final ISODuration duration= conveter.parseString(isoDurationString: durationToConvert);
print(duration.toString());
```
