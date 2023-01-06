import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/search/cubit/search_cubit.dart';
import 'package:marchant/presentation/search/cubit/search_state.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/filter_price_indicator_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: whiteAppBarWidget(
              context: context,
              title: StringsManager.filter,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Higher Rating
                            Row(
                              children: [
                                Text(
                                  StringsManager.higherRating,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: FontSizeManager.s16,
                                          color: ColorManager.greyDark,
                                          fontWeight: FontWeightManager.bold),
                                ),
                                const Spacer(),
                                Checkbox(
                                  value: cubit.isHigherRating,
                                  onChanged: (value) {
                                    cubit.changeCheckButtonState('rate');
                                  },
                                ),
                              ],
                            ),
                            DriverWidget(
                              topSize: AppSize.none,
                              bottomSize: AppSize.none,
                            ),
                            //Faster delivery
                            Row(
                              children: [
                                Text(
                                  StringsManager.fasterDelivery,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: FontSizeManager.s16,
                                          color: ColorManager.greyDark,
                                          fontWeight: FontWeightManager.bold),
                                ),
                                const Spacer(),
                                Checkbox(
                                  value: cubit.isFasterDelivery,
                                  onChanged: (value) {
                                    cubit.changeCheckButtonState('faster');
                                  },
                                ),
                              ],
                            ),
                            DriverWidget(
                              topSize: AppSize.none,
                            ),

                            //price
                            Text(
                              StringsManager.price,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: FontSizeManager.s16,
                                      color: ColorManager.greyDark,
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

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p24,
                            vertical: AppPadding.p8),
                        child: Column(
                          children: [
                            DriverWidget(
                              topSize: AppSize.none,
                              bottomSize: AppSize.none,
                            ),
                            //Nearest Location
                            Row(
                              children: [
                                Text(
                                  StringsManager.nearestLocation,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: FontSizeManager.s16,
                                          color: ColorManager.greyDark,
                                          fontWeight: FontWeightManager.bold),
                                ),
                                const Spacer(),
                                Checkbox(
                                  value: cubit.isNearestLocation,
                                  onChanged: (value) {
                                    cubit.changeCheckButtonState('location');
                                  },
                                ),
                              ],
                            ),
                            DriverWidget(
                              topSize: AppSize.none,
                              bottomSize: AppSize.none,
                            ),

                            //Have Delivery
                            Row(
                              children: [
                                Text(
                                  StringsManager.haveDelivery,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: FontSizeManager.s16,
                                          color: ColorManager.greyDark,
                                          fontWeight: FontWeightManager.bold),
                                ),
                                const Spacer(),
                                Checkbox(
                                  value: cubit.isHaveDelivery,
                                  onChanged: (value) {
                                    cubit.changeCheckButtonState('delivery');
                                  },
                                ),
                              ],
                            ),
                            DriverWidget(
                              topSize: AppSize.none,
                              bottomSize: AppSize.none,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p24, vertical: AppPadding.p8),
                  child: Column(
                    children: [
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
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
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
          );
        },
      ),
    );
  }
}
