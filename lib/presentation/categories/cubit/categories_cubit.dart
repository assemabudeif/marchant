import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/models/category_common_model.dart';
import 'package:marchant/models/category_item_model.dart';
import 'package:marchant/models/category_nearest_model.dart';
import 'package:marchant/presentation/categories/cubit/categories_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(BuildContext context) => BlocProvider.of(context);

  CategoryItemModel foodProduct = CategoryItemModel(
    categoriesImages: [
      ImageAssets.spicesFoodProducts,
      ImageAssets.fishFoodProducts,
      ImageAssets.meatMarkeFoodProducts,
      ImageAssets.dawagenFoodProducts,
    ],
    commonModel: [
      CategoryCommonModel(
        name: 'Khier Zaman',
        image: ImageAssets.boutcherShop2,
        rate: 1,
        reviewsNum: '402',
        ratingNum: 1.5,
        location: StringsManager.haramGiza,
      ),
      CategoryCommonModel(
        name: 'Ragab Sons',
        image: ImageAssets.boutcherShop2,
        rate: 2,
        reviewsNum: '402',
        ratingNum: 1.5,
        location: StringsManager.haramGiza,
      ),
      CategoryCommonModel(
        name: 'Kazyon Market',
        image: ImageAssets.boutcherShop2,
        rate: 3,
        reviewsNum: '402',
        ratingNum: 1.5,
        location: StringsManager.haramGiza,
      ),
    ],
    nearestModel: [
      CategoryNearestModel(
        name: 'Kazyon',
        image: ImageAssets.kazyonMarketNearest,
        category: 'Super Market',
        rate: 3,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'BMI',
        image: ImageAssets.bimNearest,
        category: 'Super Market',
        rate: 4,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'Al Othiem',
        image: ImageAssets.alOthiemNearest,
        category: 'Hyper Market',
        rate: 5,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'El Gezawy',
        image: ImageAssets.elGizawyNearest,
        category: 'Super Market',
        rate: 2.5,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
    ],
    commonText: StringsManager.commonMarkets,
    nearestText: StringsManager.nearestMarkets,
    appBarTitle: StringsManager.foodProducts,
  );

  CategoryItemModel restaurants = CategoryItemModel(
    appBarTitle: StringsManager.restaurant,
    commonText: StringsManager.commonRestaurants,
    nearestText: StringsManager.nearestRestaurants,
    categoriesImages: [
      ImageAssets.pizzaCategories,
      ImageAssets.fastFood,
      ImageAssets.seaFood,
      ImageAssets.koshariCategories,
    ],
    commonModel: [
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.kfc,
        rate: 2.5,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.tahreer,
        rate: 4,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: 'Estacoza',
        rate: 3,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
    ],
    nearestModel: [
      CategoryNearestModel(
        name: StringsManager.hardees,
        image: ImageAssets.hardees,
        distance: '10 KM',
        category: StringsManager.fastFood,
        rate: 3,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.kfc,
        image: ImageAssets.kfcRestaurant,
        distance: '10 KM',
        category: 'Fried Chicken ',
        rate: 2.5,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.macRestaurant,
        image: ImageAssets.macRestaurant,
        distance: '10 KM',
        category: 'Burger',
        rate: 4,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'Pizza King',
        image: ImageAssets.pizzaKingRestaurant,
        distance: '10 KM',
        category: 'Pizza',
        rate: 5,
        time: StringsManager.available24Hours,
      ),
    ],
  );

  CategoryItemModel fastFood = CategoryItemModel(
    appBarTitle: StringsManager.fastFood,
    commonText: 'Common Fast Foods',
    nearestText: 'Nearest Fast Food Restaurants',
    categoriesImages: [
      ImageAssets.pizzaCategories,
      ImageAssets.fastFood,
      ImageAssets.seaFood,
      ImageAssets.koshariCategories,
    ],
    commonModel: [
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.kfc,
        rate: 2.5,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.tahreer,
        rate: 4,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: 'Estacoza',
        rate: 3,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
    ],
    nearestModel: [
      CategoryNearestModel(
        name: StringsManager.hardees,
        image: ImageAssets.hardees,
        distance: '10 KM',
        category: StringsManager.fastFood,
        rate: 3,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.kfc,
        image: ImageAssets.kfcRestaurant,
        distance: '10 KM',
        category: 'Fried Chicken ',
        rate: 2.5,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.macRestaurant,
        image: ImageAssets.macRestaurant,
        distance: '10 KM',
        category: 'Burger',
        rate: 4,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'Pizza King',
        image: ImageAssets.pizzaKingRestaurant,
        distance: '10 KM',
        category: 'Pizza',
        rate: 5,
        time: StringsManager.available24Hours,
      ),
    ],
  );
}
