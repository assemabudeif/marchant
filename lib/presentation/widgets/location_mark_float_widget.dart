import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class LocationMarkFloatWidget extends StatelessWidget {
  const LocationMarkFloatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.primaryLight,
      onPressed: () {},
      child: const Icon(
        Icons.location_on_rounded,
        color: ColorManager.white,
        size: AppSize.s32,
      ),
    );
  }
}
