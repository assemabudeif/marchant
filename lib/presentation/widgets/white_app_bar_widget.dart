import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';

whiteAppBarWidget ({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) => AppBar(
      backgroundColor: ColorManager.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: ColorManager.primary,
        ),
      ),
      centerTitle: true,
  actions: actions,
  leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: ColorManager.accent,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
);

