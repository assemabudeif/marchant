import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/home/cubit/home_cubit.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../resources/colors_manager.dart';
import '../widgets/home_list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            StringsManager.gizaEmbaba,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          DropdownButton(
                            items: [],
                            onChanged: (index) {},
                            iconSize: AppSize.s40,
                            elevation: 0,
                            icon: const Icon(Icons.keyboard_arrow_down_outlined,
                                color: ColorManager.black),
                          ),
                          Text(
                            StringsManager.welcomeAhmed,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: AppSize.s20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: ColorManager.grey3,
                              size: AppSize.s32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CarouselSlider(
                      items: cubit.items
                          .map(
                            (e) => Image.asset(e,
                                height:
                                    MediaQuery.of(context).size.height * 0.2),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.2,
                        autoPlay: true,
                        initialPage: 0,
                        reverse: false,
                        enlargeCenterPage: true,
                        clipBehavior: Clip.antiAlias,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, page) {
                          cubit.changeIndicatorIndex(index.toDouble());
                        },
                      ),
                    ),
                    SmoothIndicator(
                      offset: cubit.indicatorIndex,
                      count: cubit.items.length,
                      effect: const WormEffect(
                        dotColor: ColorManager.grey2,
                        activeDotColor: ColorManager.primaryLight,
                        type: WormType.normal,
                        strokeWidth: AppSize.s4,
                        dotHeight: AppSize.s16,
                        dotWidth: AppSize.s16,
                        spacing: AppSize.s10,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    //Most Restaurants
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringsManager.mostRestaurants,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              StringsManager.viewAll,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorManager.primaryLight),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      height: AppSize.s155,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const HomeListItemWidget();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    //Free Delivery
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringsManager.freeDelivery,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              StringsManager.viewAll,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorManager.primaryLight),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      height: AppSize.s155,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const HomeListItemWidget();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    //Common Brands
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringsManager.commonBrands,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              StringsManager.viewAll,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorManager.primaryLight),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      height: AppSize.s155,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const HomeListItemWidget();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
