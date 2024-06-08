
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/mark_Attendance_match.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/mark_Attendance_student.dart';
import 'package:ams_flutter/features/onboarding/presentation/User/Pages/mark_Attendance_teacher.dart';
import 'package:ams_flutter/route/app_pages.dart';
import 'package:ams_flutter/route/custom_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageData()),
        ChangeNotifierProvider(create: (context) => ImageData1()),
        // Add more providers here if needed
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: kNavigatorKey,
      initialRoute: AppPages.appEntry,
      onGenerateRoute: CustomNavigator.controller,

    );
  }
}
