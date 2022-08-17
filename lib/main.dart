import 'package:faculty_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'shared/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      home: SplashScreen(),
    );
  }
}
