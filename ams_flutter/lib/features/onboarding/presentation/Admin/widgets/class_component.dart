// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../route/app_pages.dart';
import '../../../../../route/custom_navigator.dart';

class ClassComponent extends StatefulWidget {
  final bool isMarked;
  final String classroomId;
  const ClassComponent({
    Key? key,
    required this.isMarked,
    required this.classroomId
  }) : super(key: key);

  @override
  State<ClassComponent> createState() => _ClassComponentState();
}

class _ClassComponentState extends State<ClassComponent> {
  @override
  Widget build(BuildContext context) {
    MyMediaQuery.init(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MyMediaQuery.screenWidth * 0.9,
      height: MyMediaQuery.screenHeight * 0.24,
      decoration: const BoxDecoration(
          color: AppColors.classComponentBgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            title:  Text(
              widget.classroomId,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white),
            ),
            subtitle: const Text(
              '2022 - 26',
              style: TextStyle(color: AppColors.white),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: widget.isMarked
                      ? AppColors.professorThemeColor
                      : AppColors.classComponentNotMarkedColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Text(
                widget.isMarked ? 'Marked' : ' Not Marked',
                style: const TextStyle(color: AppColors.white, fontSize: 10),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MyMediaQuery.screenWidth * 0.3,
                  height: MyMediaQuery.screenHeight * 0.04,
                  decoration: const BoxDecoration(
                      color: AppColors.classComponentBtnBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.group,
                        color: AppColors.white,
                        size: 15,
                      ),
                      Text(
                        'Total Strength',
                        style: TextStyle(color: AppColors.white, fontSize: 9),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.professorThemeColor,
                        child: Text('96',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 9)),
                      ),
                    ],
                  )),
              Container(
                  width: MyMediaQuery.screenWidth * 0.3,
                  height: MyMediaQuery.screenHeight * 0.04,
                  decoration: const BoxDecoration(
                      color: AppColors.classComponentBtnBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.book,
                        color: AppColors.white,
                        size: 15,
                      ),
                      const Text(
                        'Student',
                        style: TextStyle(color: AppColors.white, fontSize: 8),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: AppColors.professorThemeColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Text(
                          'Lorem ipsum',
                          style: TextStyle(color: AppColors.white, fontSize: 8),
                        ),
                      )
                    ],
                  )),
              Container(
                  width: MyMediaQuery.screenWidth * 0.26,
                  height: MyMediaQuery.screenHeight * 0.04,
                  decoration: const BoxDecoration(
                      color: AppColors.classComponentBtnBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Venue',
                        style: TextStyle(color: AppColors.white, fontSize: 10),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: AppColors.professorThemeColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Text(
                          'Nano building',
                          style: TextStyle(color: AppColors.white, fontSize: 8),
                        ),
                      )
                    ],
                  )),
            ],
          ),
          const Text("Timing : 13:30PM - 14:30PM",
              style: TextStyle(
                  color: AppColors.classComponentTimingColor, fontSize: 15)),
          SizedBox(
            width: MyMediaQuery.screenWidth * 0.51,
            height: MyMediaQuery.screenHeight * 0.05,
            child: ElevatedButton(
    style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    backgroundColor: AppColors.professorThemeColor),
                onPressed: ()
      {CustomNavigator.pushTo(
                  context,
                  AppPages.markAttendance, // Pass user type as argument
                );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mark Attendance',
                      style: TextStyle(fontSize: 13, color: AppColors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.white,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
