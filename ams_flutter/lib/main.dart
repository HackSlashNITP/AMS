import 'package:ams_flutter/features/onboarding/presentation/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          // child: Text('Hello World!'),
          // child: Image.asset('Assets/images/splash_screen.png'),
          child: SplashScreen(),

        ),
      ),
    );
  }
}
