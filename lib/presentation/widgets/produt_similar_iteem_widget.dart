import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class ProductSimilarItemWidget extends StatelessWidget {
  final String name;
  final String image;
   Function() onTap;

   ProductSimilarItemWidget({Key? key, required this.name, required this.image, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.s100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: ColorManager.grey2,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
          /* Image.asset(
              image,
              width: 191,
              height: AppSize.s100,
              fit: BoxFit.fill,
            ),*/
            Image.asset(
              ImageAssets.shadoImage,
              width: 191,
              fit: BoxFit.fill,
            ),
            Text(
              name,
              style: const TextStyle(
                color: ColorManager.white,
                fontWeight: FontWeightManager.regular,
                fontFamily: FontConstants.fontFamily,
                fontSize: AppSize.s14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
