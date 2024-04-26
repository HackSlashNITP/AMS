
import 'package:ams_flutter/route/app_pages.dart';
import 'package:ams_flutter/route/custom_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
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
