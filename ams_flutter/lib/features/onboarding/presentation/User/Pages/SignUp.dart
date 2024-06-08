import 'dart:typed_data';

import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_icons.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_string.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/core/helpers/pick_image.dart';
import 'package:ams_flutter/features/onboarding/datasource/auth_methods.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/elevated_button.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/text_field_widget.dart';
import 'package:ams_flutter/route/app_pages.dart';
import 'package:ams_flutter/route/custom_navigator.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final nameController = TextEditingController();
  final branchController = TextEditingController();
  final rollController = TextEditingController();
  final sectioncontroller = TextEditingController();
  Uint8List? _image;
  final String allowedDomain = "nitp.ac.in";
  bool _isLoading = false;

  void signUpUser() async {
    String res = await Authmethods().SignUpStudent(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        branch: branchController.text,
        roll: rollController.text,
        section: sectioncontroller.text,
        file: _image!);
    // if string returned is sucess, user has been created
    if (res == "Success") {
      setState(() {
        _isLoading = true;
      });
      CustomNavigator.pushReplace(
        context,
        AppPages.homeStudent, // Pass user type as argument
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    rollController.dispose();
    branchController.dispose();
    cpasswordController.dispose();
    sectioncontroller.dispose();
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
                child: Text(PROVIDE_YOUR_DETAIL,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFontFamily.poppins))),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                        backgroundColor: Colors.red,
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                        backgroundColor: Colors.red,
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () async {
                      Uint8List img = await ImagePickHelper()
                          .pickimage(ImageSource.gallery);
                      setState(() {
                        _image = img;
                      });
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            const Text(
              ADD_PHOTO,
              style: TextStyle(fontSize: 12, color: AppColors.grey),
            ),
            TextFieldController(
                obscureText: false,
                textEditingController: nameController,
                hinttext: NAME,
                textInputType: TextInputType.name),
            TextFieldController(
                obscureText: false,
                textEditingController: emailController,
                hinttext: EMAIL,
                textInputType: TextInputType.emailAddress),
            TextFieldController(
                obscureText: false,
                textEditingController: branchController,
                hinttext: BRANCH,
                textInputType: TextInputType.text),
            TextFieldController(
                obscureText: false,
                textEditingController: sectioncontroller,
                hinttext: SECTION,
                textInputType: TextInputType.text),
            TextFieldController(
                obscureText: false,
                textEditingController: rollController,
                hinttext: ROLL,
                textInputType: TextInputType.number),
            TextFieldController(
                obscureText: true,
                textEditingController: passwordController,
                hinttext: PASSWORD_TEXT_FIELD,
                textInputType: TextInputType.text),
            TextFieldController(
                obscureText: true,
                textEditingController: cpasswordController,
                hinttext: CONFIRM_PASSWORD_TEXT_FIELD,
                textInputType: TextInputType.text),
            GestureDetector(
              onTap: () {
                signUpUser();
              },
              child: Container(
                height: 45,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.secondary),
                margin:
                    EdgeInsets.only(left: 4.5, right: 4.5, top: 30, bottom: 20),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('SignUp',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        )),
              ),
            ),
            const Text(
              SIGNIN_TEXT_FIELD,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFamily: AppFontFamily.poppins,
                  color: AppColors.darkgrey),
            ),
            const OtherLoginBox(
                text: GOOGLE_SIGIN_TEXT_FIELD, path: AppIcons.google_icon),
            const OtherLoginBox(
                text: FACEBOOK_SIGIN_TEXT_FIELD, path: AppIcons.facebook_icon),
          ]),
        ),
      ),
    );
  }
}
