import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';

class OrderSummaryPaymentMethodWidget extends StatelessWidget {
  final String method;

  const OrderSummaryPaymentMethodWidget({Key? key, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                horizontal: AppPadding.p16, vertical: AppPadding.p8),
            child: Row(
              children: [
                const Text(
                  StringsManager.paymentMethod,
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: AppSize.s14,
                    fontWeight: FontWeightManager.bold,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(ImageAssets.creditCardCartIcon),
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
                horizontal: AppPadding.p16, vertical: AppPadding.p8),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImageAssets.dollarIcon),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    const Text(
                      StringsManager.cash,
                      style: TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s15,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    if (method == 'cash') const Spacer(),
                    if (method == 'cash')
                      const Icon(
                        Icons.check_circle,
                        color: ColorManager.greenDark,
                      ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImageAssets.visaIcon),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    const Text(
                      StringsManager.visaFromHome,
                      style: TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s15,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    if (method == 'home') const Spacer(),
                    if (method == 'home')
                      const Icon(
                        Icons.check_circle,
                        color: ColorManager.greenDark,
                      ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImageAssets.creditIcon),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    const Text(
                      StringsManager.creditCard,
                      style: TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s15,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    if (method == 'credit') const Spacer(),
                    if (method == 'credit')
                      const Icon(
                        Icons.check_circle,
                        color: ColorManager.greenDark,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
