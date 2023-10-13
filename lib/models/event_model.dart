import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';

@freezed
class TrashCalendarModel with _$TrashCalendarModel {
  factory TrashCalendarModel({
    required final String eventName,
    required DateTime from,
    required DateTime to,
    required Color background,
    required bool isAllDay,
  }) = _TrashCalendarModel;
}
