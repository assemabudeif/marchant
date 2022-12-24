import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class ShopSearchBarWidget extends StatelessWidget {
  Function() onTap;

  ShopSearchBarWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSize.s33,
        color: ColorManager.primaryMoreLight,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
        child: Row(
          children: [
            Text(
              '100 Product',
              style: const TextStyle(
                color: ColorManager.grey4,
                fontSize: AppSize.s12,
                fontWeight: FontWeightManager.bold,
                fontFamily: FontConstants.fontFamily,
              ),
            ),
            const SizedBox(
              width: AppSize.s12,
            ),
            SvgPicture.asset(
              ImageAssets.categories,
              color: ColorManager.grey3,
              width: AppSize.s14,
              height: AppSize.s14,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageAssets.sortingIcon,
                  width: AppSize.s14,
                  height: AppSize.s14,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_list_bulleted_outlined,
                  color: ColorManager.grey3,
                )),
          ],
        ),
      ),
    );
  }
}
