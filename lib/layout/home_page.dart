import 'package:faculty_project/shared/cubit/app_cubit.dart';
import 'package:faculty_project/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/styles/colors_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                // selectedItemColor: Colors.deepOrange,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeCurrentPage(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.folder,
                        color: ColorManager.primary,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.show_chart,
                        color: ColorManager.primary,
                      ),
                      label: ''),
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
