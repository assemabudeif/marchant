import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/shop/cubit/shop_cubit.dart';
import 'package:marchant/presentation/shop/cubit/shop_state.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/shop_category_item_widget.dart';
import 'package:marchant/presentation/widgets/shop_item_horizontal_widget.dart';
import 'package:marchant/presentation/widgets/shop_item_vertical_widget.dart';
import 'package:marchant/presentation/widgets/shop_search_bar_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorManager.primaryLight,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.search);
                    },
                    icon: SvgPicture.asset(
                      ImageAssets.categories,
                      color: ColorManager.grey3,
                      width: AppSize.s28,
                      height: AppSize.s28,
                      fit: BoxFit.fill,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.shopFilet);
                    },
                    icon: Image.asset(ImageAssets.filterIcon)),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //Market Image
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        ImageAssets.muskMarket,
                        width: double.infinity,
                        height: AppSize.s156,
                      ),
                      Image.asset(
                        ImageAssets.shadoImage,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              'MUSK MARKET',
                              style: const TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeightManager.medium,
                                fontFamily: FontConstants.fontFamily,
                                fontSize: AppSize.s20,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                cubit.changeFavorite();
                              },
                              icon: CircleAvatar(
                                radius: AppSize.s25,
                                backgroundColor: ColorManager.accent,
                                child: Icon(
                                  cubit.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: AppSize.s19,
                                  color: cubit.isFavorite
                                      ? ColorManager.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.shopAbout);
                              },
                              icon: const CircleAvatar(
                                radius: AppSize.s25,
                                backgroundColor: ColorManager.accent,
                                child: Icon(
                                  Icons.info_outline,
                                  size: AppSize.s19,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //categories
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p17,
                      top: AppPadding.p20,
                    ),
                    child: SizedBox(
                      height: AppSize.s70,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ShopCategoryItemWidget(
                          image: cubit.model[index].image,
                          text: cubit.model[index].name,
                          isTaped: cubit.model[index].isTaped,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: AppSize.s16,
                        ),
                        itemCount: cubit.model.length,
                      ),
                    ),
                  ),

                  //product and offers and search
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppPadding.p30,
                      left: AppPadding.p30,
                    ),
                    child: Column(
                      children: [
                        DriverWidget(),

                        //product and offers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //products
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  cubit.changeButton('products');
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        StringsManager.products,
                                        style: TextStyle(
                                          color: cubit.isProducts
                                              ? ColorManager.primary
                                              : ColorManager.grey4,
                                          fontSize: AppSize.s16,
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                      ),
                                    ),
                                    if (cubit.isProducts)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 3.0,
                                            color: cubit.isProducts
                                                ? ColorManager.primary
                                                : ColorManager.grey2,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 1.0,
                              height: AppSize.s34,
                              color: ColorManager.grey2,
                            ),
                            // offers
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  cubit.changeButton('offers');
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        StringsManager.offers,
                                        style: TextStyle(
                                          color: cubit.isOffers
                                              ? ColorManager.primary
                                              : ColorManager.grey4,
                                          fontSize: AppSize.s16,
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                      ),
                                    ),
                                    if (cubit.isOffers)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 3.0,
                                            color: cubit.isOffers
                                                ? ColorManager.primary
                                                : ColorManager.grey2,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //search
                        ShopSearchBarWidget(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.search);
                          },
                        ),
                      ],
                    ),
                  ),

                  //product items
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                      vertical: AppPadding.p19,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ShopItemVerticalWidget(
                              inCart: false,
                              isFavorite: false,
                              name: 'Lasnshon Halwany',
                              price: '20 EGP / 1 KG',
                              image: ImageAssets.lanshonOffer,
                              rate: 4,
                            ),
                            ShopItemVerticalWidget(
                              inCart: true,
                              isFavorite: true,
                              name: 'Lasnshon Halwany',
                              price: '20 EGP / 1 KG',
                              image: ImageAssets.lanshonOffer,
                              rate: 4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        ShopItemHorizontalWidget(
                          inCart: false,
                          isFavorite: false,
                          name: 'Lasnshon Halwany',
                          price: '20 EGP / 1 KG',
                          image: ImageAssets.lanshonOffer,
                          rate: 4,
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        ShopItemHorizontalWidget(
                          inCart: true,
                          isFavorite: true,
                          name: 'Lasnshon Halwany',
                          price: '20 EGP / 1 KG',
                          image: ImageAssets.lanshonOffer,
                          rate: 4,
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
