import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_icons.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/core/constants/dummy_models.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/bottom_navbar.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_string.dart';
class MarkAttendance extends StatefulWidget {
  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}
class _MarkAttendanceState extends State<MarkAttendance> {
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
              TextFieldController(textEditingController: TextEditingController(),
               hinttext: "SearchStudent", textInputType: TextInputType.name,
               prefixIcon: Icon(Icons.search),
               borderRadius: 40,
               ),
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
        Image.asset(
          AppImages.arrow_image,
          width: mq.width * 0.06,
          height: mq.width * 0.06,
        ),
        Image.asset(
          AppImages.bell_image,
          width: mq.width * 0.06,
          height: mq.width * 0.06,
        ),
      ],
    );
  }

}
