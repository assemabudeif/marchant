import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/shop/cubit/shop_cubit.dart';
import 'package:marchant/presentation/shop/cubit/shop_state.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class ShopAboutScreen extends StatelessWidget {
  /* final int branchesNum;
  final double rate;
  final String summary;
  final String address;*/

  const ShopAboutScreen({Key? key}) : super(key: key);

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
              title: StringsManager.about,
              context: context,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //branches
                    Row(
                      children: [
                        Text(
                          StringsManager.ourBranches,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        Container(
                          height: AppSize.s26,
                          width: AppSize.s26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorManager.grey1,
                          ),
                          child: const Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: ColorManager.greyDark,
                                fontSize: AppSize.s13,
                                fontWeight: FontWeightManager.bold,
                                fontFamily: FontConstants.fontFamily,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.branches);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorManager.accent,
                          ),
                        ),
                      ],
                    ),
                    DriverWidget(),
                    // Available Payment methods
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.availablePaymentMethods,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Container(
                              height: AppSize.s33,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                color: ColorManager.grey1,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p10),
                                child: const Center(
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s13,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s10,
                            ),
                            Container(
                              height: AppSize.s33,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                color: ColorManager.grey1,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(AppPadding.p10),
                                  child: Text(
                                    'Visa card',
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s13,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s10,
                            ),
                            Container(
                              height: AppSize.s33,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                color: ColorManager.grey1,
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(AppPadding.p10),
                                  child: Text(
                                    'Credit card',
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s13,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    DriverWidget(),
                    //reviews
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.reviews);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.reviews,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s16,
                                  fontFamily: FontConstants.fontFamily,
                                ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                height: AppSize.s50,
                                width: AppSize.s50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10),
                                  color: ColorManager.primaryMoreLight,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(AppPadding.p10),
                                  child: const Center(
                                    child: Text(
                                      '4.0',
                                      style: TextStyle(
                                        color: ColorManager.greyDark,
                                        fontSize: AppSize.s18,
                                        fontWeight: FontWeightManager.bold,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.s18,
                              ),
                              RatingBar.builder(
                                unratedColor: ColorManager.greyDark,
                                initialRating: 4,
                                minRating: 1,
                                itemSize: AppSize.s25,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.zero,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star_rounded,
                                  color: ColorManager.accent,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    DriverWidget(),
                    //summary
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.summary,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          '''Some information about this shop will be enough etc Some information about this shop will be enough.\nSome information about this shop will be enough etc ''',
                          style: TextStyle(
                            color: ColorManager.greyDark,
                            fontSize: AppSize.s13,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                    DriverWidget(),
                    //images
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.images,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: ColorManager.accent,
                              ),
                            ),
                            Expanded(
                              child: CarouselSlider(
                                items: cubit.images
                                    .map(
                                      (e) => Container(
                                        height: AppSize.s70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s7)),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.asset(
                                          e,
                                          width: AppSize.s79,
                                          height: AppSize.s69,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                carouselController: cubit.controller,
                                options: CarouselOptions(
                                  height: AppSize.s70,
                                  autoPlay: false,
                                  initialPage: 0,
                                  reverse: false,
                                  clipBehavior: Clip.antiAlias,
                                  viewportFraction: 0.35,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, page) {
                                    cubit.changeCarouselIndex(index);
                                  },
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                cubit.controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorManager.accent,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    DriverWidget(),
                    //address
                    Row(
                      children: [
                        Text(
                          StringsManager.address,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    '735 street bla bla bla',
                                    style: const TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s13,
                                      //fontWeight: FontWeightManager.medium,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    DriverWidget(),
                    //Location on map
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.locationOnMap,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.shopLocationOnMap,
                              ),
                              Image.asset(
                                ImageAssets.shopRectangleImag,
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: ColorManager.white,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    StringsManager.pressHere,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s16,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    DriverWidget(),
                    //work time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.workTimes,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text('Saturday : 10 AM - 10 PM')),
                                Expanded(child: Text('Sunday : 10 AM - 10 PM')),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text('Saturday : 10 AM - 10 PM')),
                                Expanded(child: Text('Sunday : 10 AM - 10 PM')),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text('Saturday : 10 AM - 10 PM')),
                                Expanded(child: Text('Sunday : 10 AM - 10 PM')),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text('Saturday : 10 AM - 10 PM')),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s30,
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
