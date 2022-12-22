import 'package:flutter/material.dart';
import 'package:marchant/models/category_item_model.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/category_common_item_widget.dart';
import 'package:marchant/presentation/widgets/category_nearest_list_item_widget.dart';
import 'package:marchant/presentation/widgets/category_search_text_form_widget.dart';
import 'package:marchant/presentation/widgets/location_mark_float_widget.dart';

class CategoryItemScreenWidget extends StatelessWidget {
  final CategoryItemModel model;

  const CategoryItemScreenWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.appBarTitle,
          style: const TextStyle(
            letterSpacing: 0.0,
            fontFamily: FontConstants.fontFamily,
            fontSize: AppSize.s20,
            color: ColorManager.white,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CategorySearchTextFieldWidget(searchController: searchController),
            const SizedBox(
              height: AppSize.s12,
            ),
            // categories Images
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p12),
              child: SizedBox(
                height: AppSize.s92,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Image.asset(
                    model.categoriesImages[index],
                    width: AppSize.s92,
                    height: AppSize.s92,
                    // fit: BoxFit.fill,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: AppSize.s12,
                  ),
                  itemCount: model.categoriesImages.length,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s30,
            ),

            // common restaurant
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      model.commonText,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: AppSize.s18,
                            fontFamily: FontConstants.fontFamily,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      StringsManager.showAll,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.primaryLight,
                            fontFamily: FontConstants.fontFamily,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p12),
              child: SizedBox(
                height: 152,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoryCommonListItemWidget(
                    model: model.commonModel[index],
                    onTap: (){
                      Navigator.pushNamed(context, Routes.shop);

                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: AppSize.s14,
                  ),
                  itemCount: model.commonModel.length,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s32,
            ),

            //Nearest Restaurants
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      model.nearestText,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: AppSize.s18,
                            fontFamily: FontConstants.fontFamily,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      StringsManager.showAll,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.primaryLight,
                            fontFamily: FontConstants.fontFamily,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p22),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CategoryNearestListItemWidget(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.shop);

                  },
                  model: model.nearestModel[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppSize.s22,
                ),
                itemCount: model.nearestModel.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const LocationMarkFloatWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
