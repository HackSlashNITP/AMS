import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldController extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final TextInputType textInputType;
  final Icon? prefixIcon;
  final double borderRadius;
  final border = 1;
  final bool obscureText;

  const TextFieldController({
    super.key,
    required this.textEditingController,
    required this.hinttext,
    required this.textInputType,
    this.prefixIcon,
    this.borderRadius = 8.0,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 44,
        child: TextFormField(
          obscureText: obscureText,
          controller: textEditingController,
          keyboardType: textInputType,
          decoration: InputDecoration(
              prefixIcon: prefixIcon != null ? prefixIcon : null,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              hintText: hinttext,
              hintStyle: TextStyle(color: AppColors.grey),
              focusColor: AppColors.grey,
              enabledBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide: BorderSide(color: AppColors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey))),
        ),
      ),
    );
  }
}
