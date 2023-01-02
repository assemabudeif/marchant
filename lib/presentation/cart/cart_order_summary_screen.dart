import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/cart/car_order_done_screen.dart';
import 'package:marchant/presentation/cart/cubit/cart_cubit.dart';
import 'package:marchant/presentation/cart/cubit/cart_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/cart_bottom_navigation_bar_widget.dart';
import 'package:marchant/presentation/widgets/cart_progress_line_widget.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/order_summary_payment_method_widget.dart';
import 'package:marchant/presentation/widgets/order_summary_product_item_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class CartOrderSummaryScreen extends StatelessWidget {
  const CartOrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CartCubit.get(context);

          return Scaffold(
            appBar: whiteAppBarWidget(context: context, title: 'Musk Market'),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p8),
                child: Column(
                  children: [
                    const CartProgressLineWidget(
                      pageNum: 2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //order products
                    Card(
                      elevation: AppSize.s30,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p16,
                                vertical: AppPadding.p8),
                            child: Row(
                              children: [
                                const Text(
                                  StringsManager.yourOrderPrice,
                                  style: TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '50 EGP',
                                  style: const TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.changeProductsShowIcon();
                                  },
                                  child: Icon(
                                    cubit.showCartOrders
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_rounded,
                                    color: ColorManager.accent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (cubit.showCartOrders)
                            DriverWidget(
                              topSize: AppSize.none,
                            ),
                          if (cubit.showCartOrders)
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  OrderSummaryProductItemWidget(
                                image: ImageAssets.lanshonOffer,
                                name: 'Lasnshon Halwany',
                                price: 50,
                                quantity: '1KG',
                                description:
                                    '''Some description will be here bla bla bla bla bla bla''',
                              ),
                              separatorBuilder: (context, index) =>
                                  DriverWidget(
                                bottomSize: AppSize.none,
                                topSize: AppSize.none,
                              ),
                              itemCount: 2,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //delivery fees
                    Card(
                      elevation: AppSize.s30,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p16,
                            vertical: AppPadding.p8),
                        child: Row(
                          children: [
                            const Text(
                              StringsManager.deliveryFees,
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s14,
                                fontWeight: FontWeightManager.bold,
                                fontFamily: FontConstants.fontFamily,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text(
                              '50 EGP',
                              style: const TextStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s14,
                                fontWeight: FontWeightManager.bold,
                                fontFamily: FontConstants.fontFamily,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              ImageAssets.myOrderIcon,
                              color: ColorManager.grey2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //discount coupon
                    Card(
                      elevation: AppSize.s30,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p16,
                                vertical: AppPadding.p8),
                            child: Row(
                              children: [
                                const Text(
                                  StringsManager.discountCoupon,
                                  style: TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(ImageAssets.discountCouponIcon),
                              ],
                            ),
                          ),
                          DriverWidget(
                            bottomSize: AppSize.none,
                            height: 2.0,
                            topSize: AppSize.none,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p16,
                                vertical: AppPadding.p8),
                            child: Row(
                              children: [
                                const Text(
                                  'BTSHFHKKDNHS787',
                                  style: TextStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s13,
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.check_circle,
                                  color: ColorManager.greenDark,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //payment method
                    OrderSummaryPaymentMethodWidget(
                      method: 'cash',
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CartBottomNavigationBarWidget(
              price: '50 EGP',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CarOrderDoneScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
