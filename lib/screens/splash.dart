import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
height: double.infinity,
width: double.infinity,
      color: Colors.grey,
      child:Image.asset('assets/images/Background.png',fit: BoxFit.fill,),

    ));
  }
}
