import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class CategoryBannerItemWidget extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CategoryBannerItemWidget(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSize.s85,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorManager.grey3,
              blurRadius: 1,
              offset: Offset(2, 2), // Shadow position
            ),
            BoxShadow(
              color: ColorManager.black,
              blurRadius: 1,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
          border: Border.all(color: ColorManager.grey3, width: 0.3),
          color: ColorManager.primaryLight,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s20),
            bottomRight: Radius.circular(AppSize.s20),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              letterSpacing: AppSize.none,
              fontFamily: FontConstants.fontFamily,
              fontSize: AppSize.s20,
              color: ColorManager.white,
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ),
      ),
    );
  }
}
