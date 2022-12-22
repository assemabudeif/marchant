import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';

class ShopItemVerticalWidget extends StatelessWidget {
  const ShopItemVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      child: Card(
        elevation: AppSize.s10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              Image.asset(
                ImageAssets.lanshonOffer,
                height: 82,
                width: 143,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lasnshon Halwany',
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: AppSize.s12,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Price : 20 EGP / 1 KG',
                    style: TextStyle(
                      color: ColorManager.greyDark,
                      fontSize: AppSize.s10,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    itemSize: AppSize.s12,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.zero,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ColorManager.accent,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      DefaultButtonWidget(
                        onPressed: () {},
                        child: Text('Add to Cart',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorManager.white,
                            fontWeight: FontWeightManager.medium,
                            fontSize: FontSizeManager.s14,
                          ),
                        ),
                        width: 100,
                        radius: 15.0,
                        color: ColorManager.primaryLight,
                      ),
                      Spacer(),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: ColorManager.primaryLight,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: ColorManager.white,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
