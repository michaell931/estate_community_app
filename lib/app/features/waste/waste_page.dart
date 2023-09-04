// class WastePage extends StatelessWidget {
//   const WastePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Image(
//         image: AssetImage('images/smieci.jpg'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WastePage extends StatefulWidget {
  const WastePage({super.key});

  @override
  State<WastePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WastePage> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('123'),
        TableCalendar(
          locale: 'en_US',
          rowHeight: 80,
          focusedDay: today,
          firstDay: DateTime.utc(2010),
          lastDay: DateTime.utc(2030),
        )
      ],
    );
  }
}
