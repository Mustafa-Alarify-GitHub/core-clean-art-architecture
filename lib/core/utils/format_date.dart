/// Converts an ISO 8601 date string into a human-readable format.
///
/// The input string must be in the ISO 8601 format: `"YYYY-MM-DDTHH:MM:SS"`.
/// The output format will be `"DD-MM-YYYY HH:MM"`.
///
/// This function handles leading zeros for day, month, hour, and minute.
///
/// Example usage:
/// ```dart
/// final formatted = formatDate("2025-01-28T14:05:30");
/// print(formatted); // Output: 28-01-2025 14:05
/// ```
///
/// Throws a [FormatException] if the input string is not a valid ISO 8601 date.
String formatDate(String dateStr) {
  final DateTime date = DateTime.parse(dateStr);

  final String day = date.day.toString().padLeft(2, '0');
  final String month = date.month.toString().padLeft(2, '0');
  final String year = date.year.toString();

  final String hours = date.hour.toString().padLeft(2, '0');
  final String minutes = date.minute.toString().padLeft(2, '0');

  return '$day-$month-$year $hours:$minutes';
}
