import 'package:flutter/material.dart';

import '../layout/home_page.dart';
import '../shared/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
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
                Text('Let s Start The Survay', style: topic),
                SizedBox(
                  height: 40,
                ),
                Text('Write Your OPinion Freely and accurately', style: body),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Background.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) {
                    return const HomePage();
                  })),
                  icon: Icon(Icons.arrow_forward_ios),
                  label: Text('Get Started'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Color(0xFF222E45),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(Size.infinite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
