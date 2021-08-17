import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        calendarFormat: CalendarFormat.week,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        startingDayOfWeek: StartingDayOfWeek.sunday,
        headerVisible: false,
      ),
    );
  }
}

// class CalendarWidget extends StatelessWidget {
//   const CalendarWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TableCalendar(
//         calendarFormat: CalendarFormat.week,
//       ),
//     );
//   }
// }
