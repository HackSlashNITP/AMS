import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/mark_Attendance_student.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/mark_Attendance_teacher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MatchWidget extends StatefulWidget {
  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  bool isStudent1Matched = true;
  bool isStudent2Matched = false;
  String _response = '';
  final ip_address = "";//IP on which the flask Server is running: Command=> flask --app flaskapp run --host=0.0.0.0
  Future<void> _fetchData() async {
    try {
      final file = Provider.of<ImageData>(context, listen: false).imageFile;
      var request =
          http.MultipartRequest('POST', Uri.parse('${ip_address}/recognize'));
      request.files.add(http.MultipartFile.fromBytes(
          'file', file!.readAsBytesSync(),
          filename: file.path));
      var response = await request.send();
      // final response = await http.post(
      //   Uri.parse('http://192.168.29.12:5000/recognize'),
      //   body: {
      //     'image1': imageData,
      //     'image2': 'image2',
      //   },
      // );
      setState(() {
        _response = response.statusCode == 200 ? 'Matched' : 'Not Matched';
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final imageData = Provider.of<ImageData>(context).imageFile;
    final imageData1 = Provider.of<ImageData1>(context).imageFile;
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
                  horizontal: screenWidth * 0.08,
                  vertical: screenHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildStudentInfo(
                    context,
                    'Student',
                    imageData,
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
                    'Professor',
                    imageData1,
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
            Text(_response)
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfo(
      BuildContext context,
      String name,
      final image,
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
              // image: DecorationImage(
              //   image: AssetImage(imagePath),
              //   fit: BoxFit.cover,
              // ),
            ),
            width: screenWidth * 0.3,
            height: screenWidth * 0.4,
            child: Center(child: Image.file(image)),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _buildMatchButton(
          //       context,
          //       'MATCHED',
          //       isMatched ? AppColors.primary : AppColors.grey,
          //       screenWidth,
          //       screenHeight,
          //       () => onMatchChanged(true),
          //     ),
          //     SizedBox(width: screenWidth * 0.02),
          //     _buildMatchButton(
          //       context,
          //       'NOT MATCHED',
          //       !isMatched ? AppColors.user_red : AppColors.grey,
          //       screenWidth,
          //       screenHeight,
          //       () => onMatchChanged(false),
          //     ),
          //   ],
          // ),
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
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Back',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04,
                color: AppColors.pwhite,
              ),
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
          child: GestureDetector(
            onTap: _fetchData,
            child: Text(
              'Mark',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04,
                color: AppColors.pwhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
