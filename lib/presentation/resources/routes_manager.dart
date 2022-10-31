import 'package:flutter/material.dart';
import 'package:marchant/presentation/ads/ads_screen.dart';
import 'package:marchant/presentation/auth/forget_password/forget_password_screen.dart';
import 'package:marchant/presentation/auth/forget_password/set_new_password_screen.dart';
import 'package:marchant/presentation/auth/login/login_screen.dart';
import 'package:marchant/presentation/auth/register/register_screen.dart';

import 'package:marchant/presentation/guide/guide_screen.dart';
import 'package:marchant/presentation/home/home_layout.dart';
import 'package:marchant/presentation/location/choose_location_screen.dart';
import 'package:marchant/presentation/location/location_screen.dart';

import 'package:marchant/presentation/resources/strings_manager.dart';

class Routes {
  static const initialRoute = '/';
  static const guideRoute = '/guide';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const forgetPasswordRoute = '/forgetPassword';
  static const setNewPasswordRoute = '/setNewPasswordRoute';
  static const locationRoute = '/location';
  static const chooseLocationRoute = '/chooseLocation';
  static const ads = '/ads';
  static const home = '/home';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.initialRoute:
      //   return MaterialPageRoute(builder: (context) => const QuoteScreen());
      case Routes.guideRoute:
        return MaterialPageRoute(builder: (context) => const GuideScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
      case Routes.setNewPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const SetNewPasswordScreen());
      case Routes.locationRoute:
        return MaterialPageRoute(builder: (context) => const LocationScreen());
      case Routes.ads:
        return MaterialPageRoute(builder: (context) => const AdsScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeLayout());
      case Routes.chooseLocationRoute:
        return MaterialPageRoute(
            builder: (context) => const ChooseLocationScreen());
      // default:
      //   return defaultRoute();
    }
  }
}

Route<dynamic> defaultRoute() => MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            StringsManager.noRouteFound,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
