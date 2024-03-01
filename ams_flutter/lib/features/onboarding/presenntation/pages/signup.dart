import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
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
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 21, left: 33, right: 33),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              AppImages.logo_icon,
              height: 48,
              width: 48,
            ),
            const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Text("Provide Your Details",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFontFamily.poppins))),
            const CircleAvatar(
              radius: 47,
            ),
            const Text(
              "Add Your Photo",
              style: TextStyle(fontSize: 12, color: AppColors.grey),
            ),
            TextFieldController(
                textEditingController: _controllers[0],
                hinttext: "Name",
                textInputType: TextInputType.name),
            TextFieldController(
                textEditingController: _controllers[1],
                hinttext: "Email",
                textInputType: TextInputType.emailAddress),
            TextFieldController(
                textEditingController: _controllers[2],
                hinttext: "Phone",
                textInputType: TextInputType.phone),
            TextFieldController(
                textEditingController: _controllers[3],
                hinttext: "Roll",
                textInputType: TextInputType.number),
            TextFieldController(
                textEditingController: _controllers[4],
                hinttext: "Enrollment No",
                textInputType: TextInputType.number),
            SignupLoginButton(text: "Next"),
            const Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFamily: AppFontFamily.poppins,
                  color: AppColors.darkgrey),
            ),
            const OtherLoginBox(
                text: "Sign in with Google",
                path: AppIcons.google_icon),
            const OtherLoginBox(
                text: "Sign in with Facebook",
                path: AppIcons.facebook_icon),
          ]),
        ),
      ),
    );
  }
}
