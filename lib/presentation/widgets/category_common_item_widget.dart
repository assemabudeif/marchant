import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/models/category_common_model.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class CategoryCommonListItemWidget extends StatelessWidget {
  final CategoryCommonModel model;

  const CategoryCommonListItemWidget({super.key, required this.model});


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: AppSize.s147,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
           model.image,
            width: 173,
            height: 76,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 model.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      '${model.ratingNum} ${model.reviewsNum}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageAssets.mapIcon,
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      model.location,
                      style: Theme.of(context).textTheme.caption,
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
