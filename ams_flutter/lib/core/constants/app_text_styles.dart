import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppFontFamily {
  static const String poppins = 'Poppins';
}

class TextStyles {
  static const buttonTextStyle = TextStyle(
      fontFamily: AppFontFamily.poppins,
      fontWeight: FontWeight.w600,
      fontSize: 23.93,
      color: AppColors.white);

  static const headerTextStyle = TextStyle(
      fontFamily: AppFontFamily.poppins,
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: AppColors.title_black);
}
