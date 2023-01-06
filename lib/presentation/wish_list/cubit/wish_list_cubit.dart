import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/models/shop_category_model.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/wish_list/cubit/wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  static WishListCubit get(BuildContext context) => BlocProvider.of(context);

  bool isProducts = false;
  bool isShops = true;

  void changeButton(String type) {
    if (type == 'products') {
      isProducts = true;
      isShops = false;
    }
    if (type == 'shops') {
      isProducts = false;
      isShops = true;
    }

    emit(ChangeButtonState());
  }

  List<ShopCategoryModel> model = [
    ShopCategoryModel(
      name: 'Drinks',
      image: ImageAssets.drinksImg,
      isTaped: true,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Cleaners',
      image: ImageAssets.cleaningProductIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Foods',
      image: ImageAssets.foodsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
  ];

  RangeValues priceValues = const RangeValues(500, 800);

  void changePriceIndicator(value) {
    priceValues = value;
    emit(ChangePriceIndicatorState());
  }
}
