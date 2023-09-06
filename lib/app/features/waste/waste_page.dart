import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WastePage extends StatefulWidget {
  const WastePage({super.key});

  @override
  State<WastePage> createState() => _WastePageState();
}

class _WastePageState extends State<WastePage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              decoration: const BoxDecoration(color: Colors.green),
              child: const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'Harmonogram wywozu śmieci',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          TableCalendar(
            rowHeight: 60,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              selectedTextStyle: TextStyle(color: Colors.orange, fontSize: 20),
            ),
            onDaySelected: _onDaySelected,
          ),
        ],
      ),
    );
  }
}
