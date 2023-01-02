import 'package:flutter/material.dart';
import 'package:marchant/presentation/cart/cart_save_addresses_screen.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/cart_bottom_navigation_bar_widget.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBarWidget(
          context: context,
          title: StringsManager.orderSummery,
          color: ColorManager.primaryMoreLight),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p10),
        child: Column(
          children: [
            Card(
              elevation: AppSize.s30,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.s20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Row(
                  children: [
                    const Text(
                      StringsManager.totalPrice,
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: AppSize.s14,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    Text(
                      '50 EGP',
                      style: const TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s14,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
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
                    padding: const EdgeInsets.all(AppPadding.p16),
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
                        const Spacer(),
                        const Text(
                          StringsManager.specifyDeliveryAddress,
                          style: TextStyle(
                            color: ColorManager.grey3,
                            fontSize: AppSize.s14,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DriverWidget(
                    topSize: AppSize.none,
                    bottomSize: AppSize.none,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              StringsManager.specifyDeliveryAddress,
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s14,
                                fontWeight: FontWeightManager.bold,
                                fontFamily: FontConstants.fontFamily,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CartSaveAddressesScreen()),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorManager.accent,
                                size: AppSize.s25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          StringsManager
                              .specifyDeliveryAddressToKnowDeliveryFees,
                          style: TextStyle(
                            color: ColorManager.grey2,
                            fontSize: AppSize.s13,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Card(
              elevation: AppSize.s30,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.s20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: const Text(
                      StringsManager.discountCoupon,
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: AppSize.s14,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                  ),
                  DriverWidget(
                    topSize: AppSize.none,
                    bottomSize: AppSize.none,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      children: [
                        Text(
                          StringsManager.enterDiscountCouponCode,
                          style: const TextStyle(
                            color: ColorManager.grey2,
                            fontSize: AppSize.s13,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CartBottomNavigationBarWidget(
        price: '50 EGP',
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartSaveAddressesScreen()),
          );
        },
      ),
    );
  }
}
