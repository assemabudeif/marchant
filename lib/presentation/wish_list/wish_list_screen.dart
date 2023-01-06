import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/shop_search_bar_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';
import 'package:marchant/presentation/widgets/wish_list_item_widget.dart';
import 'package:marchant/presentation/wish_list/cubit/wish_list_cubit.dart';
import 'package:marchant/presentation/wish_list/cubit/wish_list_state.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WishListCubit.get(context);
          return Scaffold(
            appBar: whiteAppBarWidget(
                context: context,
                title: StringsManager.wishList,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: ColorManager.greyDark,
                      )),
                ]),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppPadding.p30,
                      left: AppPadding.p30,
                    ),
                    child: Column(
                      children: [
                        //product and shops
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
                                  cubit.changeButton('shops');
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        StringsManager.shops,
                                        style: TextStyle(
                                          color: cubit.isShops
                                              ? ColorManager.primary
                                              : ColorManager.grey4,
                                          fontSize: AppSize.s16,
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                      ),
                                    ),
                                    if (cubit.isShops)
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
                                            color: cubit.isShops
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
                            // Navigator.pushNamed(context, Routes.search);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p17),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: AppSize.s6,
                      mainAxisSpacing: AppSize.s3,
                      childAspectRatio: 1 / 1.47,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        6,
                        (index) => WishListItemWidget(
                            inCart: false,
                            name: 'Lasnshon Halwany',
                            price: '20 EGP / 1 KG',
                            image: ImageAssets.lanshonOffer,
                            rate: 4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorManager.primaryLight,
              onPressed: () {
                Navigator.pushNamed(context, Routes.wishFilet);
              },
              child: const Icon(
                Icons.filter_alt_rounded,
                size: AppSize.s32,
                color: ColorManager.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
          );
        },
      ),
    );
  }
}
