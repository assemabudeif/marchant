import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class OrderSummaryProductItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final double price;
  final String quantity;

  const OrderSummaryProductItemWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppSize.s59,
            width: AppSize.s72,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s20)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              image,
              height: AppSize.s59,
              width: AppSize.s72,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: ColorManager.primary,
                    fontSize: AppSize.s15,
                    fontWeight: FontWeightManager.bold,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: ColorManager.greyDark,
                    fontSize: AppSize.s14,
                    fontWeight: FontWeightManager.regular,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    const Text(
                      StringsManager.price,
                      style: TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s14,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    Text(
                      '$price EGP',
                      style: const TextStyle(
                        color: ColorManager.primary,
                        fontSize: AppSize.s14,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      quantity,
                      style: const TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s14,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
