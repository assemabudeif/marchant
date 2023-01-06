import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/filter_price_indicator_widget.dart';
import 'package:marchant/presentation/widgets/shop_category_item_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

import 'cubit/shop_cubit.dart';
import 'cubit/shop_state.dart';

class ShopFilterScreen extends StatelessWidget {
  const ShopFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: whiteAppBarWidget(
              context: context,
              title: StringsManager.filter,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // shop image
                  Image.asset(
                    ImageAssets.muskMarket,
                    width: double.infinity,
                    height: AppSize.s156,
                  ),

                  // categories
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //categories
                        Text(
                          '${StringsManager.categories} :',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeightManager.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: AppSize.s70,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ShopCategoryItemWidget(
                              image: cubit.filterModel[index].image,
                              text: cubit.filterModel[index].name,
                              isTaped: cubit.filterModel[index].isTaped,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: AppSize.s16,
                            ),
                            itemCount: cubit.filterModel.length,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s14,
                        ),

                        //sub categories
                        Text(
                          StringsManager.subCategories,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeightManager.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: AppSize.s70,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ShopCategoryItemWidget(
                              image: cubit.filterModel[index].image,
                              text: cubit.filterModel[index].name,
                              isTaped: cubit.filterModel[index].isTaped,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: AppSize.s16,
                            ),
                            itemCount: cubit.filterModel.length,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s14,
                        ),

                        //brands
                        Text(
                          StringsManager.brands,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeightManager.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: AppSize.s70,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                ShopCategoryItemWidget(
                              image: cubit.filterModel[index].image,
                              text: cubit.filterModel[index].name,
                              isTaped: cubit.filterModel[index].isTaped,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: AppSize.s16,
                            ),
                            itemCount: cubit.filterModel.length,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s14,
                        ),

                        //price
                        Text(
                          StringsManager.price,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeightManager.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  //Price Indicator
                  FilterPriceIndicatorWidget(
                    priceValues: cubit.priceValues,
                    onChange: (RangeValues values) {
                      cubit.changePriceIndicator(values);
                    },
                  ),

                  //buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p24, vertical: AppPadding.p8),
                    child: Column(
                      children: [
                        DriverWidget(
                          topSize: AppSize.none,
                        ),

                        // apply
                        DefaultButtonWidget(
                          onPressed: () {},
                          text: StringsManager.apply,
                        ),

                        // reset
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsManager.reset,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: ColorManager.primary,
                                  fontSize: FontSizeManager.s16,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
