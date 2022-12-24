import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class AccountItemWidget extends StatelessWidget {
  const AccountItemWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
        child: Row(
          children: [
            SizedBox(
              width: AppSize.s44,
              child: Image.asset(
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
