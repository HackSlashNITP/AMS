import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class text_field_widget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final TextInputType textInputType;
  final border = 1;

  const text_field_widget(
      {super.key,
      required this.textEditingController,
      required this.hinttext,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 44,
        child: TextFormField(
          controller: textEditingController,
          keyboardType: textInputType,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              hintText: hinttext,
              hintStyle: TextStyle(color: AppColors.grey),
              focusColor: AppColors.grey,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: AppColors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey))),
        ),
      ),
    );
  }
}
