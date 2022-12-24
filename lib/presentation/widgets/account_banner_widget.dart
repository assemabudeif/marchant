import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class AccountBannerWidget extends StatelessWidget {
  const AccountBannerWidget({
    Key? key,
    required this.text,
    required this.onPressed, required this.isPressed,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s45,
      width: double.infinity,
      padding: const EdgeInsets.only(
        right: AppPadding.p20,
        left: AppPadding.p30,
      ),
      color: ColorManager.primaryMoreLight,
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: ColorManager.primary,
              fontSize: AppSize.s17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon:  Icon( isPressed?
            Icons.keyboard_arrow_up_outlined:
            Icons.keyboard_arrow_down_outlined,
                color: ColorManager.accent),
          ),
        ],
      ),
    );
  }
}
