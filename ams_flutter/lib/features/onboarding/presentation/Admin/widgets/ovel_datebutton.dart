// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OvelDateButton extends StatelessWidget {
  final bool currentDay;
  const OvelDateButton({
    Key? key,
    this.currentDay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 99,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          color: currentDay
              ? AppColors.secondary
              : AppColors.classComponentOvelBtnColor,
          borderRadius: BorderRadius.all(Radius.circular(190))),
      child: const Center(
          child: Text(
        ' 25\nApril',
        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}
