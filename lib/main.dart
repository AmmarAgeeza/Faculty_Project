import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'layout/combine.dart';
import 'shared/cubit/bloc_observer.dart';
import 'shared/styles/strings_manager.dart';
import 'shared/styles/theme_manager.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getAppTheme(),
      home: const Combine(),
    );
  }
}
