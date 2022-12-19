import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

import '../resources/strings_manager.dart';

class SliverAppBarWidget extends StatelessWidget {
  final Function onSkipButtonPressed;
  final bool isBackButtonVisible;
  final bool isSkipButtonVisible ;
   SliverAppBarWidget(
      {Key? key,
      required this.onSkipButtonPressed,
      required this.isBackButtonVisible,
        this.isSkipButtonVisible = true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorManager.primaryMoreLight,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
      ),
      pinned: true,
      floating: false,
      snap: false,
      leading: isBackButtonVisible
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ColorManager.accent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions:isSkipButtonVisible? [
        TextButton(
          onPressed: () {
            onSkipButtonPressed();
          },
          child: Text(
            StringsManager.skip,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorManager.primary,
                  fontWeight: FontWeightManager.regular,
                ),
          ),
        ),
      ] : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(AppPadding.p26),
          child: SvgPicture.asset(
            ImageAssets.logoSvg,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
        ),
        collapseMode: CollapseMode.pin,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s30),
          bottomRight: Radius.circular(AppSize.s30),
        ),
      ),
    );
  }
}
