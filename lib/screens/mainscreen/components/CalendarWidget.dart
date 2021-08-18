import 'package:bukutamu_android/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: TableCalendar(
              headerVisible: false,
              calendarFormat: CalendarFormat.week,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: calendarTextStyle3,
                  weekendStyle: calendarTextStyle3
              ),
              calendarStyle: CalendarStyle(
                  withinRangeTextStyle: calendarTextStyle2,
                  weekendTextStyle: calendarTextStyle2,
                  defaultTextStyle: calendarTextStyle2,
                  todayTextStyle: calendarTextStyle1,
                  todayDecoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 10),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )
                  )
              )
          ),
        ),
    );
  }
}
