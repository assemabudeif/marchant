import 'package:flutter/material.dart';
import 'package:marchant/presentation/about/about_app_screen.dart';
import 'package:marchant/presentation/account/account_screen.dart';
import 'package:marchant/presentation/account/accountn_iformation_screen.dart';
import 'package:marchant/presentation/branches/branches_screen.dart';
import 'package:marchant/presentation/change_password/change_password_screen.dart';
import 'package:marchant/presentation/ads/ads_screen.dart';
import 'package:marchant/presentation/auth/forget_password/forget_password_screen.dart';
import 'package:marchant/presentation/auth/forget_password/set_new_password_screen.dart';
import 'package:marchant/presentation/auth/login/login_screen.dart';
import 'package:marchant/presentation/auth/register/register_screen.dart';
import 'package:marchant/presentation/categories/categories_screen.dart';
import 'package:marchant/presentation/contact_us/contact_us_screen.dart';
import 'package:marchant/presentation/guide/guide_screen.dart';
import 'package:marchant/presentation/home/home_layout.dart';
import 'package:marchant/presentation/location/choose_location_screen.dart';
import 'package:marchant/presentation/location/location_screen.dart';
import 'package:marchant/presentation/my_orders/my_orders_screen.dart';
import 'package:marchant/presentation/policy/privacy_policy_screen.dart';
import 'package:marchant/presentation/product/product_screen.dart';

import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/reviews/reviews_screen.dart';
import 'package:marchant/presentation/search/search_screen.dart';
import 'package:marchant/presentation/shop/shop_about_screen.dart';
import 'package:marchant/presentation/shop/shop_screen.dart';
import 'package:marchant/presentation/wish_list/wish_list_screen.dart';

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
  static const categories = '/categories';
  static const account = '/account';
  static const accountInformation = '/accountInformation';
  static const changePassword = '/change_Password';
  static const about = '/about';
  static const policy = '/policy';
  static const contactUs = '/contact_us';
  static const shop = '/shop';
  static const shopAbout = '/shop_about';
  static const branches = '/branches';
  static const reviews = '/reviews';
  static const search = '/search';
  static const product = '/product';
  static const wishList = '/wish_list';
  static const myOrders = '/my_ordrs';
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
      case Routes.categories:
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      case Routes.account:
        return MaterialPageRoute(builder: (context) => const AccountScreen());
      case Routes.accountInformation:
        return MaterialPageRoute(
            builder: (context) => const AccountInformationScreen());
      case Routes.changePassword:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen());
      case Routes.about:
        return MaterialPageRoute(builder: (context) => const AboutAppScreen());
      case Routes.policy:
        return MaterialPageRoute(
            builder: (context) => const PrivacyPolicyScreen());
      case Routes.contactUs:
        return MaterialPageRoute(builder: (context) => ContactusScreen());
      case Routes.shop:
        return MaterialPageRoute(builder: (context) => ShopScreen());
      case Routes.shopAbout:
        return MaterialPageRoute(builder: (context) => ShopAboutScreen());
      case Routes.branches:
        return MaterialPageRoute(builder: (context) => BranchesScreen());
      case Routes.reviews:
        return MaterialPageRoute(builder: (context) => ReviewsScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (context) => SearchScreen());
      case Routes.product:
        return MaterialPageRoute(builder: (context) => ProductScreen());
      case Routes.wishList:
        return MaterialPageRoute(builder: (context) => WishListScreen());
      case Routes.myOrders:
        return MaterialPageRoute(builder: (context) => MyOrdersScreen());
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
