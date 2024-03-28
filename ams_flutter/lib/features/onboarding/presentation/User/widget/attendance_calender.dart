import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AttendanceCalendar extends StatelessWidget {
  final List<bool> attendanceStatus;

  const AttendanceCalendar({Key? key, required this.attendanceStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(246, 246, 246, 1),
      ),
      width: 378,
      height: 376,
      padding: EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 31 + 7, 
        itemBuilder: (BuildContext context, int index) {
          if (index < 7) {
            return _buildDayOfWeekCell(index);
          } else {
            final date = index - 6;
            return _buildDateCell(date, attendanceStatus[date - 1]);
          }
        },
      ),
    );
  }

  Widget _buildDayOfWeekCell(int index) {
    final daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(daysOfWeek[index]),
    );
  }

  Widget _buildDateCell(int date, bool isPresent) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
        
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.red;
            }
            return isPresent ? AppColors.studentThemeColor : Colors.red; 
          }),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            CircleBorder(),
          ),
        ),
        child: Text(
          '$date',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
