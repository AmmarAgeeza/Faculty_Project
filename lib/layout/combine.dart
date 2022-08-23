import 'package:flutter/material.dart';

import '../screens/sign.dart';
import '../screens/splash_screen.dart';
import '../shared/styles/assets_manager.dart';
import '../shared/styles/colors_manager.dart';

class Combine extends StatefulWidget {
  const Combine({Key? key}) : super(key: key);

  @override
  CombineState createState() => CombineState();
}

class CombineState extends State<Combine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      //background
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              ColorManager.white2,
              ColorManager.greyWhite,
              ColorManager.white3,
              ColorManager.blue10,

            ],
          ),
        ),
        //image
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 670.0,
            width: 400.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageAssets.combine,
                ),
              ),
            ),
          ),
          //button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) {
                    return const Sign();
                  })),
                  child: const Text('Sign up')),
              OutlinedButton(
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) {
                    return const SplashScreen();
                  })),
                  child: const Text('Questionnaire'))
            ],
          ),
        ]),
      ),
    );
  }
}
