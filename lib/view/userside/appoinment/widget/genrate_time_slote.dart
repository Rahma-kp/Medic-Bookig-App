import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> generateTimeSlots(String startTime, String endTime) {
  List<String> timeSlots = [];

  try {
    DateTime start = parseTime(startTime);
    DateTime end = parseTime(endTime);

    while (start.isBefore(end)) {
      timeSlots.add(formatTime(start));
      start = start.add(const Duration(minutes: 30));
    }
  } catch (e) {
    debugPrint('Error generating time slots: $e');
  }

  return timeSlots;
}

DateTime parseTime(String time) {
  final trimmedTime = time.trim();
  final components = trimmedTime.split(' ');
  final hourMinute = components[0].split(':');
  final hour = int.tryParse(hourMinute[0]);
  final minute = int.tryParse(hourMinute[1]);
  final isPM = components[1].toUpperCase() == 'PM';
  if (hour != null && minute != null) {
    return DateTime(0, 0, 0, isPM && hour != 12 ? hour + 12 : hour, minute);
  }
  throw const FormatException('Invalid time format');
}

String formatTime(DateTime time) {
  final format = DateFormat.jm();
  return format.format(time);
}
