import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class OrderDetailsOrderItemWidget extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productDescription;

  const OrderDetailsOrderItemWidget(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // product image
        Container(
          height: AppSize.s59,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s15)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            productImage,
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
              //productName
              Text(
                productName,
                style: const TextStyle(
                  color: ColorManager.primary,
                  fontSize: AppSize.s15,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              //Description
              Text(
                productDescription,
                style: const TextStyle(
                  color: ColorManager.greyDark,
                  fontSize: AppSize.s14,
                  fontWeight: FontWeightManager.regular,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // price
              Row(
                children: [
                  const Text(
                    StringsManager.price,
                    style: TextStyle(
                      color: ColorManager.greyDark,
                      fontSize: AppSize.s15,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  Text(
                    productPrice,
                    style: const TextStyle(
                      color: ColorManager.primary,
                      fontSize: AppSize.s15,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    productQuantity,
                    style: const TextStyle(
                      color: ColorManager.greyDark,
                      fontSize: AppSize.s15,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
