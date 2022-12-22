import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/review_item_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBarWidget(
        title: StringsManager.reviews,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: AppSize.s50,
                    width: AppSize.s50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorManager.primaryMoreLight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Center(
                        child: Text(
                          '4.0',
                          style: TextStyle(
                            color: ColorManager.greyDark,
                            fontSize: AppSize.s18,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        unratedColor: ColorManager.greyDark,
                        initialRating: 4,
                        minRating: 1,
                        itemSize: AppSize.s25,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Based On 1500 Reviews',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: AppSize.s14)),
                    ],
                  ),
                ],
              ),
              const DriverWidget(),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => ReviewItemWidget(
                  review:
                      'Great Shop Great Shop Great  Great Shop Great Shop Great Great Shop Great  Great Great Shop Great',
                  rate: 4.0,
                  name: 'Ahmed Ali',
                  image: ImageAssets.reviewUserImg,
                ),
                separatorBuilder: (context, index) => const DriverWidget(),
                itemCount: 15,
              ),
              // ReviewItemWidget
            ],
          ),
        ),
      ),
    );
  }
}
