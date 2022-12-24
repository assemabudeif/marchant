import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/account/account_screen.dart';
import 'package:marchant/presentation/home/home_screen.dart';
import 'package:marchant/presentation/product/product_screen.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';

import '../../categories/categories_screen.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<String> items = [
    for (int i = 0; i < 5; i++) ImageAssets.pizzaKing,
  ];
  double indicatorIndex = 0;
  int currentIndex = 0;
  List<Items> navItems = [
    Items(
      index: 0,
      text: StringsManager.home,
      icon: ImageAssets.home,
      onPressed: () {},
    ),
    Items(
        index: 1,
        text: StringsManager.categories,
        icon: ImageAssets.categories,
        onPressed: () {}),
    Items(
      index: 2,
      text: StringsManager.cart,
      icon: ImageAssets.cart,
      onPressed: () {},
    ),
    Items(
      index: 3,
      text: StringsManager.orders,
      icon: ImageAssets.orders,
      onPressed: () {},
    ),
    Items(
      index: 4,
      text: StringsManager.setting,
      icon: ImageAssets.profile,
      onPressed: () {},
    ),
  ];

  void changeIndicatorIndex(double index) {
    emit(HomeInitial());
    indicatorIndex = index;
    emit(ChangeIndicatorIndexState());
  }

  Widget? pages(context, index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return  Container();
      case 3:
        return ProductScreen();
      case 4:
        return const AccountScreen();
    }
    return null;
  }

  void changePageIndex(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(ChangePageIndexState());
  }
}

class Items {
  int? index;
  String? text;
  String? icon;
  Function? onPressed;

  Items({
    required this.index,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
}
