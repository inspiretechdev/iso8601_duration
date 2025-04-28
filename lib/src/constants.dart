const String packageName = 'MyApp';
const String packageVersion = '1.0.0';
const String packageDescription = 'A sample Dart package';
const String packageAuthor = 'Your Name';
const String invalidCharacterRegex = r'[^\wPTYMWDHMS]';

const String isoDurationEmptyError =
    'ISO 8601 duration string cannot be empty.';
const String isoDurationInvalidStartError =
    'ISO 8601 duration string must start with "P".';
const String isoDurationInvalidCharacterError =
    'Invalid characters in ISO 8601 duration string.';
const String isoDurationParsingError = 'Failed to parse duration component: ';
const String isoDurationInvalidFormatError =
    'Invalid format for ISO 8601 duration string.';
const String isoDurationInvalidWeekError =
    'ISO 8601 duration string cannot contain both weeks and days.';
const String isoDurationInvalidTimeError =
    'ISO 8601 duration string cannot contain both date and time components.';
