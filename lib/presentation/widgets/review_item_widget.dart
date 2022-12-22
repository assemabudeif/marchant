import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class ReviewItemWidget extends StatelessWidget {
  final String image;
  final String review;
  final String name;
  final double rate;
  const ReviewItemWidget({Key? key, required this.image, required this.review, required this.rate, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.primaryMoreLight,
              radius: 28,
              child: Image.asset(
image,
                height: AppSize.s55,
                width: AppSize.s55,
              ),
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                              fontSize: AppSize.s17,
                              color: ColorManager.black)),
                      const Spacer(),
                      RatingBar.builder(
                        unratedColor: ColorManager.greyDark,
                        initialRating: rate,
                        minRating: 1,
                        itemSize: AppSize.s15,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.zero,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: ColorManager.accent,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Wrap(
                    children: [
                      Text(
                        review,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: AppSize.s12),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
