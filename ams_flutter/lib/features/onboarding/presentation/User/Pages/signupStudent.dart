import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/providedetailspage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_string.dart';
import '../../Admin/pages/home_page.dart';
import '../../Admin/widgets/auth_widgets.dart';

class SignUpPageStudent extends StatefulWidget {
  const SignUpPageStudent({super.key});

  @override
  State<SignUpPageStudent> createState() => SignUpPageStudentState();
}

class SignUpPageStudentState extends State<SignUpPageStudent> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final String allowedDomain = "nitp.ac.in";
  bool isChecked = false;

  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null && userCredential.user!.email != null) {
        if (userCredential.user!.email!.endsWith("@" + allowedDomain)) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
          showToast("User Signed In Successfully");
        } else {
          _showErrorDialoge("Please use an Valid email of $allowedDomain");
        }
      }
    } catch (e) {
      _showErrorDialoge(
          "Error during sign-in: Please check credentials and try again $e");
    }
  }

  void _showErrorDialoge(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      showSuccessDialog(context);
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _rememberMe = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.app_icon,
              height: 48,
              width: 48,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  WELCOME_TEXT,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: EMAIL_TEXT_FIELD,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      labelText: PASSWORD_TEXT_FIELD,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      side: BorderSide(
                        color: AppColors.borderColor,
                      ),
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      }),
                  Text(
                    REMEMBER_TEXT_FIELD,
                    style:
                        TextStyle(color: AppColors.borderColor, fontSize: 13),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      _resetPassword(context);
                    },
                    child: Text(
                      FORGET_PASSWORD_TEXT_FIELD,
                      style:
                          TextStyle(color: AppColors.borderColor, fontSize: 13),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.navIconColor,
                    backgroundColor: AppColors.tabBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 7),
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                child: Text(
                  SIGNIN_TEXT_FIELD,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: _signIn,
              ),
              SizedBox(height: 13),
              Row(
                children: [
                  Text(
                    '    New Here ?',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage()));
                    },
                    child: Text(
                      CREATE_ACCOUNT_TEXT_FIELD,
                      style: TextStyle(
                          color: AppColors.tabBackgroundColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                SIGNIN_TEXT_FIELD,
                style: TextStyle(
                    color: AppColors.borderColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.borderColor,
                        backgroundColor: AppColors.navIconColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                        textStyle: TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.g_translate,
                        ),
                        SizedBox(width: 20),
                        Text(
                          GOOGLE_SIGIN_TEXT_FIELD,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.borderColor,
                        backgroundColor: AppColors.navIconColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                        textStyle: TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook),
                        SizedBox(width: 20),
                        Text(
                          FACEBOOK_SIGIN_TEXT_FIELD,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
