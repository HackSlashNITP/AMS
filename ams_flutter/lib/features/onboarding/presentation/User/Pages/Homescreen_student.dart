import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/student_class_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        const ListTile(
          leading: CircleAvatar(
            radius: 20,
          ),
          title: Text(
            'Hey Piyush',
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
                style: TextStyle(fontSize: 12),
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
