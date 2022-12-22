import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class ShopCategoryItemWidget extends StatelessWidget {
  final String image;
  final String text;
  bool isTaped ;


  ShopCategoryItemWidget(
      {super.key,
      required this.image,
      required this.text, required this.isTaped,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isTaped = !isTaped;
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                 isTaped? ImageAssets.squareIcon : ImageAssets.whiteSquare,
              ),
              Image.asset(image,
                color: isTaped? ColorManager.white : ColorManager.grey4 ,

              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          Text(
            text,
            style: TextStyle(
              color: isTaped? ColorManager.accent : ColorManager.grey4 ,
              fontSize: AppSize.s14,
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.fontFamily,
            ),
          )
        ],
      ),
    );
  }
}
