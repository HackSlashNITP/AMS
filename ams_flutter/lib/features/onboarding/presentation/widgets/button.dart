import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignupLoginButton extends StatelessWidget {
  final String text;

  const SignupLoginButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: AppColors.secondary),
      margin: EdgeInsets.only(left: 4.5, right: 4.5, top: 30, bottom: 20),
      child: Text(text,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          )),
    );
  }
}
