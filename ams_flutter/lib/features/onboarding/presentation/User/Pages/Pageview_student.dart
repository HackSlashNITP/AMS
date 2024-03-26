import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/signup.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/Homescreen_student.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewStudentScreen extends StatefulWidget {
  const ViewStudentScreen({Key? key}) : super(key: key);
  @override
  State<ViewStudentScreen> createState() => _ViewStudentScreenState();
}

class _ViewStudentScreenState extends State<ViewStudentScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationtab(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: navigationtab,
        children: [HomeScreenStudent(), SignUpPage(), Text("Profile")],
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: CupertinoTabBar(
            onTap: onPageChange,
            currentIndex: _page,
            backgroundColor: AppColors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                    color: _page == 0 ? AppColors.primary : AppColors.white,
                  ),
                  label: '',
                  backgroundColor: AppColors.darkgrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_rounded,
                      size: 35,
                      color: _page == 1 ? AppColors.primary : AppColors.white),
                  label: '',
                  backgroundColor: AppColors.darkgrey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                      size: 35,
                      color: _page == 2 ? AppColors.primary : AppColors.white),
                  label: '',
                  backgroundColor: AppColors.darkgrey),
            ],
          ),
        ),
      ),
    );
  }
}
