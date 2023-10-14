import 'package:estate_community_app/features/waste/cubit/waste_state.dart';
import 'package:estate_community_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WasteCubit extends Cubit<WasteState> {
  WasteCubit() : super(const WasteState());

  Future<void> generateTrashCalendar() async {
    List<TrashCalendarModel> models = [];
    DateTime now = DateTime.now();
    while (models.length < 22) {
      if (now.weekday == DateTime.friday) {
        models.add(
          TrashCalendarModel(
            eventName: 'Plastiki',
            from: DateTime(now.year, now.month, now.day, 5, 0, 0),
            to: DateTime(now.year, now.month, now.day, 22, 0, 0),
            background: const Color(0xFF0F8644),
            isAllDay: true,
          ),
        );
      } else if (now.weekday == DateTime.wednesday) {
        models.add(
          TrashCalendarModel(
            eventName: 'Papier',
            from: DateTime(now.year, now.month, now.day, 5, 0, 0),
            to: DateTime(now.year, now.month, now.day, 22, 0, 0),
            background: const Color.fromARGB(255, 17, 12, 189),
            isAllDay: true,
          ),
        );
      } else if (now.weekday == DateTime.monday) {
        models.add(
          TrashCalendarModel(
            eventName: 'Szkło',
            from: DateTime(now.year, now.month, now.day, 5, 0, 0),
            to: DateTime(now.year, now.month, now.day, 22, 0, 0),
            background: const Color.fromARGB(255, 12, 189, 83),
            isAllDay: true,
          ),
        );
      } else if (now.weekday == DateTime.thursday) {
        models.add(
          TrashCalendarModel(
            eventName: 'Pozostałości po segregacji',
            from: DateTime(now.year, now.month, now.day, 5, 0, 0),
            to: DateTime(now.year, now.month, now.day, 22, 0, 0),
            background: const Color.fromARGB(255, 0, 0, 0),
            isAllDay: true,
          ),
        );
      } else if (now.weekday == DateTime.tuesday) {
        models.add(
          TrashCalendarModel(
            eventName: 'Bioodpady',
            from: DateTime(now.year, now.month, now.day, 5, 0, 0),
            to: DateTime(now.year, now.month, now.day, 22, 0, 0),
            background: const Color.fromARGB(255, 140, 70, 0),
            isAllDay: true,
          ),
        );
      }
      now = now.add(const Duration(days: 1));
    }
    emit(WasteState(
      documents: models,
    ));
  }
}
