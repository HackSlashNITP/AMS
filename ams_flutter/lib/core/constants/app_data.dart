import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppData {
  static List<GButton> bottomNavItems = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    const GButton(
      icon: Icons.format_list_bulleted,
      text: 'Search',
    ),
    const GButton(
      icon: Icons.dashboard_outlined,
      text: 'dashboard',
    ),
    const GButton(
      icon: Icons.person,
      text: 'Profile',
    ),
  ];
  static List<GButton> user_bottomNavItems = [
    const GButton(
      icon: Icons.home,
    ),
    const GButton(
      icon: Icons.list_rounded,
    ),
    const GButton(
      icon: Icons.person,
    ), 
  ];
}
