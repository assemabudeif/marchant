import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class CartProgressLineWidget extends StatelessWidget {
  final int pageNum;

  const CartProgressLineWidget({Key? key, required this.pageNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Row(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: const [
              Icon(
                Icons.circle,
                color: ColorManager.primary,
                size: 50,
              ),
              Icon(
                Icons.location_on,
                color: ColorManager.white,
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 2.0,
              color: pageNum > 1 ? ColorManager.primary : ColorManager.greyDark,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                pageNum > 1 ? Icons.circle : Icons.circle_outlined,
                color:
                    pageNum > 1 ? ColorManager.primary : ColorManager.greyDark,
                size: 50,
              ),
              SvgPicture.asset(
                ImageAssets.creditCardCartIcon,
                color: pageNum > 1 ? ColorManager.white : ColorManager.greyDark,
                height: AppSize.s19,
                width: AppSize.s19,
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 2.0,
              color: pageNum > 2 ? ColorManager.primary : ColorManager.greyDark,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                pageNum > 2 ? Icons.circle : Icons.circle_outlined,
                color:
                    pageNum > 2 ? ColorManager.primary : ColorManager.greyDark,
                size: 50,
              ),
              SvgPicture.asset(ImageAssets.myOrderIcon,
                  color:
                      pageNum > 2 ? ColorManager.white : ColorManager.greyDark),
            ],
          ),
        ],
      ),
    );
  }
}
