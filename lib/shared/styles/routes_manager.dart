
import 'package:faculty_project/layout/home_page.dart';
import 'package:faculty_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homePageRoute = '/homePage';

}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
        case Routes.homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:  const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
