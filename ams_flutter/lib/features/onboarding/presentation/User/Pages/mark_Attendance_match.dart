import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MatchWidget extends StatefulWidget {
  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  bool isStudent1Matched = true;
  bool isStudent2Matched = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.04,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: AppColors.primary, size: screenWidth * 0.075),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08, vertical: screenHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildStudentInfo(
                    context,
                    'Steve - 1',
                    AppImages.student_dummy_image,
                    isStudent1Matched,
                    screenWidth,
                    screenHeight,
                    (isMatched) {
                      setState(() {
                        isStudent1Matched = isMatched;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05), // reduced gap
                  _buildStudentInfo(
                    context,
                    'Steve - 2',
                    AppImages.student_dummy_image,
                    isStudent2Matched,
                    screenWidth,
                    screenHeight,
                    (isMatched) {
                      setState(() {
                        isStudent2Matched = isMatched;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05), // reduced gap
                  _buildInfoContainer(
                    screenWidth,
                    screenHeight,
                    '3891 Ranchview Dr. Richardson, California 62639',
                  ),
                  SizedBox(height: 10),
                  _buildDateTimeContainer(
                      screenWidth, screenHeight, '28 FEB 2024', '12:30:32'),
                  SizedBox(height: screenHeight * 0.08),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildButtonRow(screenWidth, screenHeight)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfo(
      BuildContext context,
      String name,
      String imagePath,
      bool isMatched,
      double screenWidth,
      double screenHeight,
      Function(bool) onMatchChanged) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
              color: AppColors.pwhite,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            width: screenWidth * 0.3,
            height: screenWidth * 0.4,
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.01),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.05,
                color: AppColors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMatchButton(
                context,
                'MATCHED',
                isMatched ? AppColors.primary : AppColors.grey,
                screenWidth,
                screenHeight,
                () => onMatchChanged(true),
              ),
              SizedBox(width: screenWidth * 0.02),
              _buildMatchButton(
                context,
                'NOT MATCHED',
                !isMatched ? AppColors.user_red : AppColors.grey,
                screenWidth,
                screenHeight,
                () => onMatchChanged(false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMatchButton(BuildContext context, String text, Color color,
      double screenWidth, double screenHeight, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(screenWidth * 0.01),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.007,
          horizontal: screenWidth * 0.05,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.025,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer(
      double screenWidth, double screenHeight, String address) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: screenWidth * 0.03),
            child: Icon(Icons.location_on),
          ),
          Expanded(
            child: Text(
              address,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.03,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeContainer(
      double screenWidth, double screenHeight, String date, String time) {
    return Container(
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(screenWidth * 0.17),
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_month,
            color: AppColors.pwhite,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(screenWidth * 0.3),
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.005,
              horizontal: screenWidth * 0.03,
            ),
            child: Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.025,
                color: AppColors.pwhite,
              ),
            ),
          ),
          Icon(Icons.access_time, color: Colors.white),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(screenWidth * 0.3),
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.005,
              horizontal: screenWidth * 0.03,
            ),
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.025,
                color: AppColors.pwhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            border: Border.all(color: AppColors.primary),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.03,
          ),
          child: Text(
            'Back',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: screenWidth * 0.04,
              color: AppColors.pwhite,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            border: Border.all(color: AppColors.primary),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.03,
          ),
          child: Text(
            'Mark',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: screenWidth * 0.04,
              color: AppColors.pwhite,
            ),
          ),
        ),
      ],
    );
  }
}
