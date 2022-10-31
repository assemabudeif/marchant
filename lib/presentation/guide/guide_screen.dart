import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/guide_page_view_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(
            child: GuidePageViewWidget(),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            child: Text(
              StringsManager.skip,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorManager.accent,
                    fontSize: 20,
                  ),
            ),
          ),
          const SizedBox(
            height: AppSize.s70,
          ),
        ],
      ),
    );
  }
}
