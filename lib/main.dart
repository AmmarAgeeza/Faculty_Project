import 'package:bloc/bloc.dart';
import 'package:faculty_project/layout/home_page.dart';
import 'package:faculty_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'shared/constants/constants.dart';
import 'shared/cubit/bloc_observer.dart';
import 'shared/styles/colors_manager.dart';
import 'shared/styles/strings_manager.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.primary,
      ),
      home: const HomePage(),
    );
  }
}
