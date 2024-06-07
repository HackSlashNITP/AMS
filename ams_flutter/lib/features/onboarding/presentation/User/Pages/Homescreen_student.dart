import 'dart:convert';
import 'dart:developer';
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/student_class_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  late String studentName = 'Loading...';
  late String studentId = 'Loading...';
  late String department = 'Loading...';
  late String section = 'Loading...';
  late String mergedClassroomId = 'Loading...';
  String ip = "192.168.242.144"; 
  String studentIdParam = 'S1001'; //  studentId 

  @override
  void initState() {
    super.initState();
    fetchStudentData(studentIdParam);
  }

  Future<void> fetchStudentData(String studentId) async {
    try {
      log("Fetching student data\n");
      final String url = 'http://$ip:8001/student/$studentId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final student = data['student'];
        log(data.toString());
        setState(() {
          studentName = student['name'];
          studentId = student['studentID']; 
          department = student['department'];
          section = student['section'];
          mergedClassroomId = student['mergedClassroomId'];
        });
      } else {
        log('Failed to load student data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error loading student data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                ),
                title: Text(
                  studentName,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "$department (Section $section)",
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.primary,
                  size: 25,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, right: 195),
                child: Text(
                  'My Classes',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return StudentClass();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
