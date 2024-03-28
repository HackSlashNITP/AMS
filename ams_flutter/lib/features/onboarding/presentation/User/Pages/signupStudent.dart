import 'package:ams_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../route/app_pages.dart';
import '../../../../../route/custom_navigator.dart';

class SignUpPageStudent extends StatefulWidget {
  const SignUpPageStudent({super.key});

  @override
  State<SignUpPageStudent> createState() => SignUpPageStudentState();
}

class SignUpPageStudentState extends State<SignUpPageStudent> {
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
                    onPressed: () {},
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
                    backgroundColor: AppColors.studentThemeColor,
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
                    color: AppColors.white
                  ),
                ),
                onPressed:
                  (){CustomNavigator.pushTo(
        context,
        AppPages.homeStudent, // Pass user type as argument
        );
        },
              ),
              SizedBox(height: 13),
              Row(
                children: [
                      Text(
                        '    New Here ?',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                 GestureDetector(
                      child:
                      Text(
                        CREATE_ACCOUNT_TEXT_FIELD,
                        style: TextStyle(
                            color: AppColors.tabBackgroundColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ), onTap: ()
                      {CustomNavigator.pushTo(
                    context,
                    AppPages.createProfile, // Pass user type as argument
                  );},
                  )
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
