// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:estate_community_app/models/event_model.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// class EventDataSource extends CalendarDataSource {



//   Stream<List<EventModel>> getItemsStream() {
//     return FirebaseFirestore.instance
//         .collection('events')
//         .snapshots()
//         .map((querySnapshot) {
//       return querySnapshot.docs.map(
//         (doc) {
//           return EventModel(eventName: doc['eventName'], from: doc['from'], to: doc['to'], background: doc['background'], isAllDay: doc['isAllDay'],);
//         },
//       ).toList();
//     });
//   }

//   Future<EventModel> get({required String id}) async {
//     final doc =
//         await FirebaseFirestore.instance.collection('events').doc(id).get();
//     return EventModel(eventName: doc['eventName'], from: doc['from'], to: doc['to'], background: doc['background'], isAllDay: doc['isAllDay']);
//   }
// }

  // List<Meeting> _getItemsStream() {
  //   final List<Meeting> events = <EventModel>[];
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //   meetings.add(Meeting(
  //       'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  //   return meetings;
  // }