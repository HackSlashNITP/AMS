import 'dart:async';
import 'package:ams_flutter/features/onboarding/presentation//pages/whoareyou.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../route/app_pages.dart';
import '../../../../../route/custom_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => CustomNavigator.pushReplace(
              context,
              AppPages.HomeStudent,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/images/splash_screen.png",
              height: 272.0,
              width: 272.0,
            ),
          ],
        ),
      ),
    );
  }
}
