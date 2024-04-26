import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_data.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar_user extends StatefulWidget {
  const BottomNavBar_user({super.key});

  @override
  State<BottomNavBar_user> createState() => _BottomNavBar_userState();
}

class _BottomNavBar_userState extends State<BottomNavBar_user> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0), // Adjust border radius as needed
        topRight: Radius.circular(30.0),
      ),
      child: GNav(
        gap: 8,
        color: AppColors.navIconColor,
        activeColor: AppColors.navActiveIconColor,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(milliseconds: 800),
        tabBackgroundColor: AppColors.user_tabBackgroundColor,
        backgroundColor: AppColors.navBackgroundColor,
        tabMargin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        tabs: AppData.user_bottomNavItems,
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
