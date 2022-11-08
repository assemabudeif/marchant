import 'package:marchant/models/category_common_model.dart';
import 'package:marchant/models/category_nearest_model.dart';

class CategoryItemModel {
  late String appBarTitle;
  late String commonText;
  late String nearestText;
  late List<String> categoriesImages;
  late List<CategoryCommonModel> commonModel;
  late List<CategoryNearestModel> nearestModel;

  CategoryItemModel({
    required this.appBarTitle,
    required this.commonText,
    required this.nearestText,
    required this.categoriesImages,
    required this.commonModel,
    required this.nearestModel,
  });
}
