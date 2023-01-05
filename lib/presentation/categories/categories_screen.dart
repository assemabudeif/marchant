import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/categories/cubit/categories_cubit.dart';
import 'package:marchant/presentation/categories/cubit/categories_state.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/category_banner_item_widget.dart';
import 'package:marchant/presentation/widgets/category_item_screen_widget.dart';

import '../widgets/home_list_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = CategoriesCubit.get(context);
    List<String> items = [
      StringsManager.restaurant,
      StringsManager.foodProducts,
      StringsManager.fastFood,
    ];
    List<dynamic> models = [
      cubit.restaurants,
      cubit.foodProduct,
      cubit.fastFood,
    ];
    return BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: ColorManager.primaryLight,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            CategoryBannerItemWidget(
                          text: items[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryItemScreenWidget(
                                  model: models[index],
                                ),
                              ),
                            );
                          },
                        ),
                        separatorBuilder: (context, i) => const SizedBox(
                          height: 0.0,
                        ),
                        itemCount: items.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: AppSize.s23,
                        mainAxisSpacing: AppSize.s32,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          10,
                          (index) => const HomeListItemWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
