import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';

/*
class WhiteAppBarWidget extends StatelessWidget {
final String title;
  const WhiteAppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  PereferedSizedWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: ColorManager.primary,
        ),
      ),
      centerTitle: true,
    );
  }
}
*/


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

