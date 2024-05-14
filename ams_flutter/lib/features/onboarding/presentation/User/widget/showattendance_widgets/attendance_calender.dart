import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ams_flutter/core/constants/app_colors.dart';
class AttendanceCalendar extends StatefulWidget {
  final List<bool> attendanceStatus;

  const AttendanceCalendar({Key? key, required this.attendanceStatus}) : super(key: key);

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(246, 246, 246, 1),
      ),
      child: TableCalendar(
        firstDay: DateTime(DateTime.now().year, DateTime.now().month - 1, 1),
        lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, 31),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        daysOfWeekVisible: true,
        weekendDays: [],
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        onDaySelected: (selectedDay, focusedDay) {
      
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) {
            final isPresent = widget.attendanceStatus[date.day - 1];
            return Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                
                shape: BoxShape.circle,
                color: isPresent ? AppColors.studentThemeColor : Colors.red,
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
