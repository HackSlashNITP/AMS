import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/studentlist.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/attendance_calender.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/bottom_navbar.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/monthselector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowAttendance extends StatefulWidget {
  @override
  State<ShowAttendance> createState() => _ShowAttendanceState();
}

class _ShowAttendanceState extends State<ShowAttendance> {
  late Size mq;
  List<Map<String, dynamic>> dummyStudents = DummyModels.dummyStudents;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(context),
            SizedBox(height: 16.0),
            _buildDropDown(context),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                // color: Colors.black12,
                width: mq.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Attendance",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            AttendanceCalendar(attendanceStatus: [
              true,
              true,
              false,
              true,
              false,
              true,
              true,
              false,
              false,
              true,
              true,
              false,
              true,
              false,
              true,
              false,
              true,
              true,
              false,
              false,
              true,
              false,
              true,
              true,
              true,
              true,
              false,
              true,
              false,
              true,
              false
            ])
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar_user(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.user_tabBackgroundColor,
            size: mq.width * 0.07,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: AppColors.user_tabBackgroundColor,
            size: mq.width * 0.07,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDropDown(BuildContext context) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BuildButton(
                text: Text("B.Tech"),
                color: AppColors.studentThemeColor,
                borderRadius: 16.0,
                height: 41,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: BuildButton(
                text: Text("Subject - 1"),
                color: AppColors.studentThemeColor,
                borderRadius: 16.0,
                height: 41,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        MonthSelector(months: months),
      ],
    );
  }
}
