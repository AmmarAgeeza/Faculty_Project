import 'package:faculty_project/screens/questionnaire_screen.dart';
import 'package:faculty_project/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/char_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  //bottom nav bar logic
  List screens = <Widget>[const QuestionnaireScreen(), const ChartScreen()];
  int currentIndex = 0;

  void changeCurrentPage(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }
}
