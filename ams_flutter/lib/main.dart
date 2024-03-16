import 'package:ams_flutter/route/app_pages.dart';
import 'package:ams_flutter/route/custom_navigator.dart';
import 'package:flutter/material.dart';
void main() async {
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: kNavigatorKey,
      initialRoute: AppPages.appEntry,
      onGenerateRoute: CustomNavigator.controller,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
