import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_icons.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/bottom_navbar.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/studentlist.dart';

class MarkAttendance extends StatefulWidget {
  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
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
            SizedBox(height: 4),
            TextFieldController(
                textEditingController: TextEditingController(),
                hinttext: "SearchStudent",
                textInputType: TextInputType.name,
                prefixIcon: Icon(Icons.search),
                borderRadius: 40),
            // SizedBox(height: 4.0),
            Expanded(
              child: SingleChildScrollView(
                child: StudentList(
                  students: dummyStudents
                      .map((student) => Student(
                            name: student['name'],
                            rollno: student['rollno'],
                            photoUrl: student['photoUrl'],
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Image.asset(
        //   AppImages.arrow_image,
        //   width: mq.width * 0.06,
        //   height: mq.width * 0.06,
        // ),
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
            size: mq.width * 0.07,
          ),
          onPressed: () {},
        ),
        // Image.asset(
        //   AppImages.bell_image,
        //   width: mq.width * 0.06,
        //   height: mq.width * 0.06,
        // ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.green,
            size: mq.width * 0.07,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDropDown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildButton(
          text: Text("B.Tech"),
          color: Colors.black,
          borderRadius: 16.0,
        ),
        BuildButton(
          text: Text("B.Tech"),
          color: Colors.black,
          borderRadius: 16.0,
        ),
        BuildButton(
          text: Text("13:30PM-14:30PM"),
          color: Colors.black,
          borderRadius: 16.0,
        ),
      ],
    );
  }
}
