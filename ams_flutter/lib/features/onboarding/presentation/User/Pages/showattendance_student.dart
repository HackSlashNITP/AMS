import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/showattendance_widgets/attendance_calender.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/bottom_navbar.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/showattendance_widgets/buildButton_user.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/showattendance_widgets/debarredstatus.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/showattendance_widgets/monthselector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowAttendance extends StatefulWidget {
  @override
  State<ShowAttendance> createState() => _ShowAttendanceState();
}

class _ShowAttendanceState extends State<ShowAttendance> {
  @override
  Widget build(BuildContext context) {
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
                // width: MediaQuery.of(context).size.width * 0.5,
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  0 for no class,1 for present  and 2 for absent
                    AttendanceCalendar(attendanceStatus: [
                      1,
                      0, 
                      2, 
                      1, 
                      0, 
                      1, 
                      1, 
                      0, 
                      0, 
                      1,  
                      1,  
                      0, 
                      1,  
                      2,
                      1,  
                      0, 
                      1,  
                      1,  
                      0,
                      0, 
                      1,  
                      0, 
                      1,  
                      1,  
                      1,  
                      1, 
                      0, 
                      1,  
                      0, 
                      1,  
                      0 
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ),
            DebarredStatusWidget(isDebarred: true),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavBar_user(),
    );
  }
  //Build methods of headers

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: AppColors.primary,
            size: MediaQuery.of(context).size.width * 0.07,
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
                color: AppColors.primary,
                borderRadius: 16.0,
                height: 41,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Expanded(
              flex: 2,
              child: BuildButton(
                text: Text("Subject - 1"),
                color: AppColors.primary,
                borderRadius: 16.0,
                height: 41,
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        MonthSelector(months: months),
      ],
    );
  }
}
