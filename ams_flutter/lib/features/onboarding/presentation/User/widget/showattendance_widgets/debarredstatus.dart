import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DebarredStatusWidget extends StatelessWidget {
  final bool isDebarred;

  const DebarredStatusWidget({Key? key, required this.isDebarred}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(83)
      ),
     
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Debarred Status",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDebarred ? AppColors.user_red: AppColors.studentThemeColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              isDebarred ? "Debarred" : "Not Debarred",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
