import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/models/category_nearest_model.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class CategoryNearestListItemWidget extends StatelessWidget {
 final CategoryNearestModel model;

  const CategoryNearestListItemWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          model.image,
          height: 92,
          width: 125,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: AppSize.s20,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: AppSize.s17,
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.primary,
                ),
              ),
              const SizedBox(
                height: AppSize.s1_5,
              ),
              Text(
                model.category,
                style: const TextStyle(
                  fontSize: AppSize.s15,
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.grey3,
                ),
              ),
              const SizedBox(
                height: AppSize.s1_5,
              ),
              Text(
                model.time,
                style: const TextStyle(
                  fontSize: AppSize.s15,
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.grey3,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    initialRating: model.rate,
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
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: AppSize.s1_5,
                      ),
                      Text(
                        model. distance,
                        style: const TextStyle(
                          fontSize: AppSize.s15,
                          fontWeight: FontWeightManager.bold,
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
