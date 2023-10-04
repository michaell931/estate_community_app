import 'package:flutter/material.dart';

class TrashCalendarModel {
  TrashCalendarModel(
      {required this.eventName,
      required this.from,
      required this.to,
      required this.background,
      required this.isAllDay});

  final String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
