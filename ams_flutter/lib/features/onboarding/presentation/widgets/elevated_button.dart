import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OtherLoginBox extends StatelessWidget {
  final String text;
  final String path;

  const OtherLoginBox({super.key, required this.text, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              path,
              height: 40,
              width: 30,
            ),
            Text(
              text,
              style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppFontFamily.poppins,
                  fontSize: 14),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 5.8,
                  offset: Offset(1, 2),
                  blurStyle: BlurStyle.solid)
            ]));
  }
}
