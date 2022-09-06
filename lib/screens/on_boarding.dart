import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../layout/combine.dart';
import '../shared/constants/constants.dart';
void main(){
  runApp(Onboarding());
}
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Onboarding_Screen()
    );
  }
}

class Onboarding_Screen extends StatefulWidget {
  @override
  _Onboarding_Screen createState() => _Onboarding_Screen();
}

class _Onboarding_Screen extends State<Onboarding_Screen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF292FF1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF2E6BD0),
                Color(0xFF144CA8),
                Color(0xFF0E3B85),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //skip container
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => print('Skip'),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      //page 1
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/choose.jpg',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),

                            const SizedBox(height: 80.0),

                            Text(
                              'welcome you are in Faculty APP',
                              style: topic,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Hope you find our app do well ,and help '
                                  'you to do what you want ,choose what you want to do',
                              style: body,
                            ),
                          ],
                        ),
                      ),
                      //page 2
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/login.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 80.0),
                            Text(
                              'Login to App to get more feature ',
                              style: topic,
                            ),
                            const SizedBox(height: 20.0),
                            Text('Save your time and Hurry up to login to see and learn more about our feature',
                              style: body,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/questionare.jpg',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 80.0),
                            Text(
                              'Let\'s Start  ',
                              style: topic,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Lets tell us about your opinion and fill questioner',
                              style: body,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 100.0,
        width: double.infinity,
        color: Colors.white,
        child: MaterialButton(
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const Combine();
              })),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color(0xFF0E3B85),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : const Text(''),
    );
  }
}

