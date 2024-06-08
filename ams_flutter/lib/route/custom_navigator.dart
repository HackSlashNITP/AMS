import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/create_password.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/home_page.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/instant_class.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/markAttendance.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/SignUp.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/signup.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/splash.dart';
import 'package:ams_flutter/features/onboarding/presentation/Admin/pages/whoareyou.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/Pageview_student.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/showattendance_student.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/signinStudent.dart';

import 'package:flutter/material.dart';

import 'app_pages.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

class CustomNavigator {
  static Route<dynamic> controller(RouteSettings settings) {
    //use settings.arguments to pass arguments in pages
    switch (settings.name) {
      case AppPages.appEntry:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      case AppPages.signUpProfessor:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
          settings: settings,
        );
      case AppPages.createNewPassword:
        return MaterialPageRoute(
          builder: (context) => const CreatePassword(),
          settings: settings,
        );
      case AppPages.createProfile:
        return MaterialPageRoute(
          builder: (context) => const DetailsPage(),
          settings: settings,
        );
      case AppPages.whoAreYou:
        return MaterialPageRoute(
          builder: (context) => WhoAreYou(),
          settings: settings,
        );
      case AppPages.homeStudent:
        return MaterialPageRoute(
          builder: (context) => ViewStudentScreen(),
          settings: settings,
        );
      case AppPages.showAttendance:
        return MaterialPageRoute(
          builder: (context) => ShowAttendance(),
          settings: settings,
        );
      case AppPages.homeProfessor:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
          settings: settings,
        );
      case AppPages.signUpStudent:
        return MaterialPageRoute(
          builder: (context) => SignUpPageStudent(),
          settings: settings,
        );
      case AppPages.markAttendance:
        return MaterialPageRoute(
          builder: (context) => MarkAttendance(),
          settings: settings,
        );

      case AppPages.instantClass:
        return MaterialPageRoute(
          builder: (context) => InstantClassCreation(),
          settings: settings,
        );
      default:
        throw ('This route name does not exit');
    }
  }

  static Future<T?> pushTo<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.of(context, rootNavigator: true)
        .pushNamed(strPageName, arguments: arguments);
  }

// Pop the top view
  static void pop(BuildContext context, {Object? result}) {
    Navigator.pop(context, result);
  }

// Pops to a particular view
  static Future<T?> popTo<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.popAndPushNamed(
      context,
      strPageName,
      arguments: arguments,
    );
  }

  static void popUntilFirst(BuildContext context) {
    Navigator.popUntil(context, (page) => page.isFirst);
  }

  static void popUntilRoute(BuildContext context, String route, {var result}) {
    Navigator.popUntil(context, (page) {
      if (page.settings.name == route && page.settings.arguments != null) {
        (page.settings.arguments as Map<String, dynamic>)["result"] = result;
        return true;
      }
      return false;
    });
  }

  static Future<T?> pushReplace<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.pushReplacementNamed(
      context,
      strPageName,
      arguments: arguments,
    );
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    BuildContext context,
    String strPageName, {
    Object? arguments,
  }) async {
    return await Navigator.pushNamedAndRemoveUntil(
      context,
      strPageName,
      (route) => false,
      arguments: arguments,
    );
  }
}
