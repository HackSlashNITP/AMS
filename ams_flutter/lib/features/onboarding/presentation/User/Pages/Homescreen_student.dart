import 'dart:convert';
import 'dart:developer';
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/student_class_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({Key? key}) : super(key: key);

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  late String studentName = 'Loading...';
  late String studentId = 'Loading...';
  late String department = 'Loading...';
  late String section = 'Loading...';
  late String mergedClassroomId = 'Loading...';
  List<String> classroomIds = [];
  List<Map<String, dynamic>> classrooms = [];
  // String ip = "192.168.1.4";
  String ip = "192.168.1.4"; //  IP address
  late String studentIdParam = 'Loading';

  @override
  void initState() {
    super.initState();
    fetchStudentId();
    fetchStudentData(studentIdParam);
    fetchClassroomsData(studentIdParam);
  }

  Future<void> fetchStudentId() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String email = user.email!;
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('student')
            .where('email', isEqualTo: email)
            .limit(1)
            .get()
            .then((snapshot) => snapshot.docs.first);
        if (userDoc.exists) {
          setState(() {
            studentIdParam = userDoc.id;
          });
          fetchStudentData(studentIdParam);
          fetchClassroomsData(studentIdParam);
        } else {
          log('User document does not exist');
        }
      } else {
        log('No user is currently logged in');
      }
    } catch (e) {
      log('Error fetching student ID: $e');
    }
  }

  Future<void> fetchStudentData(String studentId) async {
    try {
      log("Fetching student data\n");
      final String url = 'http://$ip:8001/student/$studentId';
      final response = await http.get(Uri.parse(url));
      log(studentId + "this is student id");

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

  Future<void> fetchClassroomsData(String studentId) async {
    try {
      log("Fetching classrooms data for student ID: $studentId");
      final String url = 'http://$ip:8001/student/$studentId/classrooms';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['classrooms'];
        // log(data.toString());
         log("Classroom IDs: $data");
        setState(() {
          classroomIds = List<String>.from(data);
        });
        await fetchClassroomDetails(classroomIds);
      } else {
        log('Failed to load classrooms data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error loading classrooms data: $e');
    }
  }

  Future<void> fetchClassroomDetails(List<String> classroomIds) async {
    try {
      List<Map<String, dynamic>> classroomsData = [];
      for (String classroomId in classroomIds) {
        final String url = 'http://$ip:8001/classroom/$classroomId';
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final Map<String, dynamic> classroom =
              jsonDecode(response.body)['classroom'];
          // log(classroom.toString());
          log("Classroom details for ID $classroomId: $classroom");
          classroomsData.add(classroom);
        } else {
          log('Failed to load classroom details: ${response.statusCode}');
        }
      }
      setState(() {
        classrooms = classroomsData;
      });
    } catch (e) {
      log('Error loading classroom details: $e');
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
                  itemCount: classrooms.length,
                  itemBuilder: (context, index) {
                    final classroom = classrooms[index];
                    return StudentClass(
                      subject: classroom['SubjectCode'],
                      professor: classroom[
                          'professorID'], // Replace with actual professor ID
                      classId: classroom['ClassroomID'],
                    );
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
