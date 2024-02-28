import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_strings.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/button.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/elevated_button.dart';
import 'package:ams_flutter/features/onboarding/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _contactcontroller = TextEditingController();
  TextEditingController _rollcontroller = TextEditingController();
  TextEditingController _enrollcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _namecontroller.dispose();
    _contactcontroller.dispose();
    _rollcontroller.dispose();
    _enrollcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 21, left: 33, right: 33),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              Appimages.logo_icon,
              height: 48,
              width: 48,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text("Provide Your Details",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFontFamily.poppins))),
            CircleAvatar(
              radius: 47,
            ),
            Text(
              "Add Your Photo",
              style: TextStyle(fontSize: 12, color: AppColors.grey),
            ),
            text_field_widget(
                textEditingController: _namecontroller,
                hinttext: "Name",
                textInputType: TextInputType.name),
            text_field_widget(
                textEditingController: _namecontroller,
                hinttext: "Email",
                textInputType: TextInputType.emailAddress),
            text_field_widget(
                textEditingController: _namecontroller,
                hinttext: "Phone",
                textInputType: TextInputType.phone),
            text_field_widget(
                textEditingController: _namecontroller,
                hinttext: "Roll",
                textInputType: TextInputType.number),
            text_field_widget(
                textEditingController: _namecontroller,
                hinttext: "Enrollment No",
                textInputType: TextInputType.number),
            button(text: "Next"),
            Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFamily: AppFontFamily.poppins,
                  color: AppColors.darkgrey),
            ),
            OtherLoginBox(
                text: "Sign in with Google", path: Appimages.google_icon),
            OtherLoginBox(
                text: "Sign in with Facebook", path: Appimages.facebook_icon),
          ]),
        ),
      ),
    );
  }
}
