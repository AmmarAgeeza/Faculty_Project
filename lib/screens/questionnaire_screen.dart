import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared/constants/constants.dart';
class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/back.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Text('Let s Start The Survay',style:topic),
                SizedBox(height: 40,),
                Text('Write Your OPinion Freely and accurately',style:body),
                SizedBox(height: 40,),
                Container(
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/background.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                ElevatedButton.icon(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_){return ;}))
                  , icon: Icon(Icons.arrow_forward_ios), label: Text('Get Started')
                  ,style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Color(0xFF222E45),),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(Size.infinite),
                  ),),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
