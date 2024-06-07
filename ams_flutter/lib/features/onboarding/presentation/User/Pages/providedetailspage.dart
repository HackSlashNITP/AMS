import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/core/constants/app_icons.dart';
import 'package:ams_flutter/core/constants/app_images.dart';
import 'package:ams_flutter/core/constants/app_string.dart';
import 'package:ams_flutter/core/constants/app_text_styles.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/elevated_button.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/text_field_widget.dart';
import 'package:ams_flutter/route/app_pages.dart';
import 'package:ams_flutter/route/custom_navigator.dart';// Import the ApiService

import '../../../../../route/app_pages.dart';
import '../../../../../route/custom_navigator.dart';
import '../../../../../services/userapiservices.dart';
import '../../Admin/widgets/auth_widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final rollController = TextEditingController();
  final String allowedDomain = "nitp.ac.in";

  // Initialize ApiService with your backend URL
  final ApiService apiService = ApiService(baseUrl: 'http://localhost:3001'); // Replace with your backend URL

  Future<void> _signUp() async {
    if (passwordController.text == cpasswordController.text) {
      try {
        UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Checking the email and other signup credentials
        if (userCredential.user != null && userCredential.user!.email != null) {
          if (userCredential.user!.email!.endsWith("@" + allowedDomain)) {
            try {
              // Call API to register user
              final response = await apiService.registerUser(
                emailController.text,
                passwordController.text,
                nameController.text,
                phoneController.text,
                rollController.text,
              );
              CustomNavigator.pushReplace(
                context,
                AppPages.homeStudent, // Pass user type as argument
              );
              String name = nameController.text;
              showToast("$name Signed Up Successfully");
            } catch (e) {
              showErrorDialog(context, "Error during registration: $e");
            }
          } else {
            await userCredential.user!.delete();
            showErrorDialog(context, "Please use an email from $allowedDomain.");
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          showErrorDialog(context, "The email address is already in use by another account.");
        } else {
          showErrorDialog(context, "Error during sign-up: ${e.message}");
        }
      } catch (e) {
        showErrorDialog(context, "Error during sign-up: $e");
      }
    } else {
      showToast("Both passwords should be the same");
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    rollController.dispose();
    phoneController.dispose();
    cpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 21, left: 33, right: 33),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppImages.logo_icon,
                height: 48,
                width: 48,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  PROVIDE_YOUR_DETAIL,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFontFamily.poppins,
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 47,
              ),
              const Text(
                ADD_PHOTO,
                style: TextStyle(fontSize: 12, color: AppColors.grey),
              ),
              TextFieldController(
                textEditingController: nameController,
                hinttext: NAME,
                textInputType: TextInputType.name,
              ),
              TextFieldController(
                textEditingController: emailController,
                hinttext: EMAIL,
                textInputType: TextInputType.emailAddress,
              ),
              TextFieldController(
                textEditingController: phoneController,
                hinttext: PHONE,
                textInputType: TextInputType.phone,
              ),
              TextFieldController(
                textEditingController: rollController,
                hinttext: ROLL,
                textInputType: TextInputType.number,
              ),
              TextFieldController(
                textEditingController: passwordController,
                hinttext: PASSWORD_TEXT_FIELD,
                textInputType: TextInputType.text,
              ),
              TextFieldController(
                textEditingController: cpasswordController,
                hinttext: CONFIRM_PASSWORD_TEXT_FIELD,
                textInputType: TextInputType.text,
              ),
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  height: 45,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.secondary,
                  ),
                  margin: const EdgeInsets.only(
                    left: 4.5,
                    right: 4.5,
                    top: 30,
                    bottom: 20,
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const Text(
                SIGNIN_TEXT_FIELD,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFamily: AppFontFamily.poppins,
                  color: AppColors.darkgrey,
                ),
              ),
              const OtherLoginBox(
                text: GOOGLE_SIGIN_TEXT_FIELD,
                path: 'assets/google_icon.png',
              ),
              const OtherLoginBox(
                text: FACEBOOK_SIGIN_TEXT_FIELD,
                path: 'assets/facebook_icon.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
