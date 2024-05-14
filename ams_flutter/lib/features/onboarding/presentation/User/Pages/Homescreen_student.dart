import 'dart:convert';
import 'dart:developer';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:http/http.dart' as http;
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/widget/student_class_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  late String userName = 'Loading1...';
  late String id = 'Loading1..';
  String ip = "192.168.104.119"; //Ip address of local host
  String userId = 'csdf12'; //This userId is now being used for reference
  @override
  void initState() {
    super.initState();
    fetchUserData(userId);
  }

  Future<void> fetchUserData(String userId) async {
    try {
      log("Fetching user data\n");
      final String url = 'http://$ip:8001/user/$userId';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final user = data['user'];
        log(data.toString());
        log(user['Username'].toString());
        log(user['UserID'].toString());
        setState(() {
          userName = user['Username'];
          id = user['UserID'];
          AppInfo.profileDetails[0]['value'] = user['Username'];
          AppInfo.profileDetails[1]['value'] = user['UserID'];
        });
      } else {
        print('Failed to load user data: ${response.statusCode}');
      }
    } catch (e) {
      log('there is error');
      print('Error loading user data: $e');
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 20,
          ),
          title: Text(
            userName,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                "B.Tech (Electronics Engineering)",
                style: TextStyle(fontSize: 12, color: AppColors.primary),
              )
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
              }),
        )
      ]))),
    );
  }
}
