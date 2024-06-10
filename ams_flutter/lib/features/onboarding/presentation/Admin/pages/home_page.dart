import 'dart:convert';
import 'dart:developer';
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/class_component.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/ovel_datebutton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../route/app_pages.dart';
import '../../../../../route/custom_navigator.dart';

class HomePage extends StatefulWidget {
  final String adminId;
  const HomePage({Key? key, required this.adminId}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String adminName = 'Loading...';
  late String department = 'Loading...';
  List<String> classrooms = [];
  // String ip = "192.168.116.252"; // Update this to your actual IP
  String ip = "192.168.1.4";

  @override
  void initState() {
    super.initState();
    fetchAdminData(widget.adminId);
    fetchClassrooms(widget.adminId);
  }

  Future<void> fetchAdminData(String adminId) async {
    try {
      final String url = 'http://$ip:8001/admin/$adminId';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // final admin = data['admin'];
        final List<dynamic> adminList = data['admin'];
        if (adminList.isNotEmpty) {
          final admin = adminList[0];
          setState(() {
            adminName = admin['name'];
            department = admin['department'];
          });
        } else {
          log('Failed to load admin data: ${response.statusCode}');
        }
      }
    } catch (e) {
      log('Error loading admin data: $e');
    }
  }

  Future<void> fetchClassrooms(String adminId) async {
    try {
      final String url = 'http://$ip:8001/classroom/$adminId/classrooms';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<String> fetchedClassrooms =
            List<String>.from(data['Classrooms']);
        setState(() {
          classrooms = fetchedClassrooms;
        });
      } else {
        log('Failed to load classrooms: ${response.statusCode}');
      }
    } catch (e) {
      log('Error loading classrooms: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.user_image),
                  radius: 30,
                ),
                title: Text(
                  adminName,
                  style: const TextStyle(
                    color: AppColors.professorThemeColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.notifications,
                  color: AppColors.secondary,
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 194, 190, 190)
                          .withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white60,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    if (index == 2) {
                      return const OvelDateButton(
                        currentDay: true,
                      );
                    }
                    return const OvelDateButton();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Today\'s Classes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...classrooms
                  .map((classroom) => ClassComponent(
                        isMarked: false,
                        // classroomId: classroom['ClassroomID'],
                        classroomId: classroom,
                      ))
                  .toList(),
              FloatingActionButton(
                onPressed: () {},
                child: IconButton(
                    color: AppColors.professorThemeColor,
                    onPressed: () {
                      CustomNavigator.pushTo(context, AppPages.instantClass);
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      size: 40,
                    )),
              )
              // FloatingActionButton: IconButton(
              //   color: AppColors.professorThemeColor,
              //   onPressed: () {
              //     CustomNavigator.pushTo(
              //       context,
              //       AppPages.instantClass, // Pass user type as argument
              //     );
              //   },
              //   icon: const Icon(
              //     Icons.add_circle_outline_outlined,
              //     size: 40,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
