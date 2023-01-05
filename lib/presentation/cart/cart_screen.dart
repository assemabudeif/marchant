import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/cart/cubit/cart_cubit.dart';
import 'package:marchant/presentation/cart/cubit/cart_state.dart';
import 'package:marchant/presentation/cart/order_summary_screen.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/cart_bottom_navigation_bar_widget.dart';
import 'package:marchant/presentation/widgets/category_banner_item_widget.dart';
import 'package:marchant/presentation/widgets/shop_item_horizontal_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                StringsManager.cart,
                style: TextStyle(
                  letterSpacing: AppSize.none,
                  fontFamily: FontConstants.fontFamily,
                  fontSize: AppSize.s20,
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: ColorManager.primaryLight,
                    child: Column(
                      children: [
                        CategoryBannerItemWidget(
                          text: StringsManager.foodProducts,
                          onTap: () {},
                        ),
                        CategoryBannerItemWidget(
                          text: StringsManager.restaurant,
                          onTap: () {},
                        ),
                      ],
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
                                  height: AppSize.s124,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s7)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    e,
                                    width: AppSize.s153,
                                    height: AppSize.s124,
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
                            viewportFraction: 0.53,
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
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  ShopItemHorizontalWidget(
                    inCart: true,
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
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CartBottomNavigationBarWidget(
              price: '50 EGP',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderSummaryScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
