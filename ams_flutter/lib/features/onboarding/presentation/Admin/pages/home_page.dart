import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/class_component.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/ovel_datebutton.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.user_image),
                  radius: 30,
                ),
                title: Text(
                  'Hello Dev',
                  style: TextStyle(
                    color: AppColors.professorThemeColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.notifications,
                  color: AppColors.secondary,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
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
              const ClassComponent(
                isMarked: true,
              ),
              const ClassComponent(
                isMarked: false,
              ),
              const ClassComponent(
                isMarked: false,
              ),
            ],
          ),
        ),
        floatingActionButton: IconButton(
          color: AppColors.professorThemeColor,
          onPressed: () {},
          icon: const Icon(
            Icons.add_circle_outline_outlined,
            size: 40,
          ),
        ),
      ),
    );
  }
}
