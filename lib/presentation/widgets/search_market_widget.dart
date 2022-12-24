import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class SearchMarketWidget extends StatelessWidget {
  final String name;
  final String image;
  final String distance;
  final double rate;
  Function() onTap;

  SearchMarketWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.distance,
      required this.rate,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: AppSize.s230,
            width: AppSize.s150,
            child: Card(
              margin: const EdgeInsets.all(AppSize.none),
              elevation: AppSize.s10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.s25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: AppSize.s121,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s25)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      image,
                      height: AppSize.s121,
                      width: AppSize.s150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: ColorManager.primary,
                          fontSize: AppSize.s17,
                          fontWeight: FontWeightManager.bold,
                          fontFamily: FontConstants.fontFamily,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            StringsManager.distance,
                            style: TextStyle(
                              color: ColorManager.greyDark,
                              fontSize: AppSize.s13,
                              fontWeight: FontWeightManager.bold,
                              fontFamily: FontConstants.fontFamily,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.001,
                          ),
                          const Icon(Icons.location_on_rounded),
                          Text(
                            distance,
                            style: const TextStyle(
                              color: ColorManager.greyDark,
                              fontSize: AppSize.s13,
                              fontWeight: FontWeightManager.bold,
                              fontFamily: FontConstants.fontFamily,
                            ),
                          ),
                        ],
                      ),
                      RatingBar.builder(
                        initialRating: rate,
                        minRating: 1,
                        itemSize: AppSize.s20,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
