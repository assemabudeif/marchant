import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class AccountItemWidget extends StatelessWidget {
   AccountItemWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.image,
    this.png = false
  }) : super(key: key);
  final String text;
  final String image;
  final Function() onTap;
  bool png;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p30,
          right: AppPadding.p30,
          bottom: AppPadding.p17
        ),
        child: Row(
          children: [
            SizedBox(
              width: AppSize.s44,
              child: png? Image.asset(
                image,
              ) :SvgPicture.asset(
                image,
              ),
            ),
            const SizedBox(
              width: AppSize.s25,
            ),
            Text(
              text,
              style: const TextStyle(
                color: ColorManager.greyDark,
                fontSize: AppSize.s15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
