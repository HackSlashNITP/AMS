import 'package:flutter/material.dart';

class AppColors {
  //Brand primary colors
  static const Color primary = Color.fromRGBO(247, 198, 69, 1);
  static const Color secondary = Color.fromRGBO(78, 159, 61, 1);

  //neutral colours
  static const Color grey = Color.fromRGBO(179, 179, 179, 1);
  static const Color darkgrey = Color.fromRGBO(134, 134, 134, 1);
  static const Color black = Color.fromRGBO(21, 21, 23, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color title_black = Color.fromRGBO(21, 21, 23, 1);

  // BottomNavBar Colors
  static const Color navIconColor = Colors.white;
  static const Color navActiveIconColor = Colors.white;
  static const Color tabBackgroundColor = Colors.green;
  static const Color navBackgroundColor = Colors.black;
  //signup page color
  static const Color borderColor = Colors.grey;

  //shadow colours
  static const Shadow shadow = Shadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      offset: Offset(1, 2),
      blurRadius: 5.800000190734863);
}
