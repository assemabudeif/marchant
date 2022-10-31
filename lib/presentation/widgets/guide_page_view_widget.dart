import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/guide/guide_screen.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GuidePageViewWidget extends StatefulWidget {
  const GuidePageViewWidget({Key? key}) : super(key: key);

  @override
  _GuidePageViewWidgetState createState() => _GuidePageViewWidgetState();
}

class _GuidePageViewWidgetState extends State<GuidePageViewWidget> {
  int _currentPage = 0;
  final List<Items> items = [
    Items(
        title: StringsManager.guide1Title,
        description: StringsManager.guide1Description,
        image: ImageAssets.guide1),
    Items(
        title: StringsManager.guide2Title,
        description: StringsManager.guide2Description,
        image: ImageAssets.guide2),
    Items(
        title: StringsManager.guide3Title,
        description: StringsManager.guide3Description,
        image: ImageAssets.guide3),
    Items(
        title: StringsManager.guide4Title,
        description: StringsManager.guide4Description,
        image: ImageAssets.guide4),
  ];

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: ColorManager.primaryLight,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppSize.s30),
              bottomLeft: Radius.circular(AppSize.s30),
            ),
          ),
          margin: const EdgeInsets.only(bottom: AppSize.s26),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    log(index.toString());
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: items.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(AppPadding.p30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(e.image,
                              height:
                                  MediaQuery.of(context).size.height * 0.22),
                          Text(
                            e.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            e.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: items.length,
                effect: const WormEffect(
                  dotColor: ColorManager.primaryDark,
                  activeDotColor: ColorManager.white,
                  type: WormType.normal,
                  strokeWidth: AppSize.s4,
                  dotHeight: AppSize.s16,
                  dotWidth: AppSize.s16,
                  spacing: AppSize.s10,
                ),
              ),
              const SizedBox(height: AppSize.s40),
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {
            if (_currentPage != items.length - 1) {
              _pageController.animateToPage(_currentPage + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            }
          },
          color: ColorManager.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s30),
          ),
          minWidth: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.065,
          child: Text(
            _currentPage != items.length - 1
                ? StringsManager.next
                : StringsManager.getStarted,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class Items {
  final String title;
  final String description;
  final String image;

  Items({required this.title, required this.description, required this.image});
}
