import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';

// ignore: must_be_immutable
class CartBottomNavigationBarWidget extends StatelessWidget {
  final String price;
  Function() onPress;

  CartBottomNavigationBarWidget(
      {Key? key, required this.price, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s30,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Row(
          children: [
            const Text(
              StringsManager.totalPrice,
              style: TextStyle(
                color: ColorManager.primary,
                fontSize: AppSize.s14,
                fontWeight: FontWeightManager.bold,
                fontFamily: FontConstants.fontFamily,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                color: ColorManager.greyDark,
                fontSize: AppSize.s14,
                fontWeight: FontWeightManager.bold,
                fontFamily: FontConstants.fontFamily,
              ),
            ),
            const Spacer(),
            DefaultButtonWidget(
              onPressed: onPress,
              text: StringsManager.Continue,
              width: AppSize.s121,
            ),
          ],
        ),
      ),
    );
  }
}
