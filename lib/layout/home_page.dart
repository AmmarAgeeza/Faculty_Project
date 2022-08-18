import 'package:faculty_project/shared/cubit/app_cubit.dart';
import 'package:faculty_project/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                onTap: (index){
                  cubit.changeCurrentPage(index);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.folder,color: Colors.grey,),label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.show_chart),label: ''),
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
