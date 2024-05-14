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
    static const profilePageStyle1 = TextStyle(
    fontSize: 11.36,
    fontWeight: FontWeight.w600,
    color: Color(0xff5c5c5c),
  );
  static const profilePageStyle2 = TextStyle(
    fontSize: 11.36,
    fontWeight: FontWeight.w600,
    color: Color(0xff171717),
  );
    static const profilePageHeader = TextStyle(
      fontSize: 18.06 ,
      fontWeight: FontWeight.w600,
      height: 1.5 ,
      color: Color(0xff098b06),
);   
   static const student_profilePageHeader = TextStyle(
      fontSize: 18.06 ,
      fontWeight: FontWeight.w600,
      height: 1.5 ,
      color: Color.fromRGBO(185, 198, 0, 1),
);    
}
