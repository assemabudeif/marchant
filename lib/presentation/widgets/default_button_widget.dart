import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class DefaultButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  String? text;
  Color? color;
  double? width;
  Widget? child;
  DefaultButtonWidget({
    Key? key,
    required this.onPressed,
    this.text,
    this.color = ColorManager.primary,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s30,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.013,
      ),
      color: color,
      minWidth: width ?? MediaQuery.of(context).size.width,
      child: child ??
          Text(
            text!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.bold,
                  fontSize: FontSizeManager.s17,
                ),
          ),
    );
  }
}
