import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import '../../../../../route/custom_navigator.dart';
import '../../../../../core/constants/app_string.dart';

class ProfilePage1 extends StatefulWidget {
  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  late Size mq;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(context),
              SizedBox(height: 16.0),
              _buildProfileDetails(context),
              SizedBox(height: 16.0),
              _buildAttendance(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
            size: mq.width * 0.07,
          ),
          onPressed: () {CustomNavigator.pop(context);},
        ),
        Text(
          PROFILE,
          style: TextStyles.profilePageHeader,
        ),
        Image.asset(
          AppImages.bell_image,
          width: mq.width * 0.06,
          height: mq.width * 0.06,
        ),
      ],
    );
  }
  Widget _buildProfileDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border1),
        // color: Color(0xfff8faf9),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: mq.width * 0.25,
              height: mq.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.border2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.dp_image,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          // _buildProfileRow('Name', 'Steve'),
          // _buildProfileRow('ID', '12342143'),
          // _buildProfileRow('Email', 'nit@nit.ac.in'),
          // _buildProfileRow('Contact', '78XXXXXXX'),
          // _buildProfileRow('Designation', 'Teacher'),
          // _buildProfileRow('Social Media', 'https://www.instagram.com'),
          Column(
            children: AppInfo.profileDetails
                .map((detail) =>
                    _buildProfileRow(detail['title']!, detail['value']!))
                .toList(),
          ),

          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text(EDIT_PROFILE),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.profilePageStyle1,
        ),
        Text(
          value,
          style: TextStyles.profilePageStyle2,
        ),
      ],
    );
  }

  Widget _buildAttendance(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff9b9b9b)),
        color: Color(0xfff8faf9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ATTENDANCE,
                style: TextStyles.profilePageStyle2,
              ),
              // Image.asset(
              //   AppImages.rightarrow_image,
              //   width: MediaQuery.of(context).size.width * 0.05,
              //   height: MediaQuery.of(context).size.width * 0.05,
              // ),
              Icon(
                Icons.arrow_circle_right_outlined,
                size: mq.width * 0.05,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          _buildProfileRow('Recent Month', '60%'),
          SizedBox(height: 8.0),
          Container(
            width: mq.width * 1,
            height: mq.width * 0.06,
            decoration: BoxDecoration(
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.circular(mq.width * 0.06),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.topLeft,
              widthFactor: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mq.width * 0.06),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xffdc20ed), Color(0xff0d9ebd)],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
