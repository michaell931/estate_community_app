import 'package:estate_community_app/app/data_sources/meeting_data_source.dart';
import 'package:estate_community_app/app/features/waste/cubit/waste_cubit.dart';
import 'package:estate_community_app/app/features/waste/cubit/waste_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WasteCubit()..generateTrashCalendar(),
      child: BlocBuilder<WasteCubit, WasteState>(
        builder: (context, state) {
          return Scaffold(
              body: SfCalendar(
            firstDayOfWeek: 1,
            todayHighlightColor: Colors.amber,

            view: CalendarView.month,
            dataSource: MeetingDataSource(state.documents),
            // by default the month appointment display mode set as Indicator, we can
            // change the display mode as appointment using the appointment display
            // mode property
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
          ));
        },
      ),
    );
  }
}
