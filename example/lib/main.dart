import 'package:flutter/material.dart';
import 'package:iso8601_duration/iso8601_duration.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ISODurationConverter converter = ISODurationConverter();
    final String durationString = 'PT9H25M';
    final ISODuration duration =
        converter.parseString(isoDurationString: durationString);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ISO 8601 Duration Conversion Demo ',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              duration.day.toString(),
            ),
            Text(
              duration.toString(),
            )
          ],
        ),
      ),
    );
  }
}
