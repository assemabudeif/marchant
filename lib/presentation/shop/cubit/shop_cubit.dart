import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/models/shop_category_model.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/shop/cubit/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(BuildContext context) => BlocProvider.of(context);

  List<ShopCategoryModel> model = [
    ShopCategoryModel(
      name: 'All',
      image: ImageAssets.allIcon,
      isTaped: true,
    ),
    ShopCategoryModel(
      name: 'Drinks',
      image: ImageAssets.drinksImg,
      isTaped: false,
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

  bool isFavorite = false;
  bool isProducts = false;
  bool isOffers = true;

  void changeButton(String type){
    if(type == 'products'){
      isProducts = true;
      isOffers = false;
    }
    if(type == 'offers'){
      isProducts = false;
      isOffers = true;
    }

    emit(ChangeButtonStata());
  }
  void changeFavorite(){
    isFavorite = !isFavorite;


    emit(ChangeFavoriteStata());
  }
  List<String> images = [
    for (int i = 0; i < 5; i++) ImageAssets.muskMarket,
  ];

  int activeIndex = 0;
  void changeCarouselIndex( int index){
    activeIndex = index;
    emit(ChangeCarouselIndexState());
  }
  var controller = CarouselController();


}
