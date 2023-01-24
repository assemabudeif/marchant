import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class AddAddressTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  TextInputType? keyboardType;
  Color? hintColor;

  AddAddressTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hint,
      this.keyboardType,
      this.hintColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 4,
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ColorManager.primary,
            fontWeight: FontWeightManager.medium,
            fontSize: AppSize.s16,
          ),
      cursorColor: ColorManager.primary,
      validator: (value) {
        if (value!.isEmpty) {
          return StringsManager.fieldIsRequired;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: hintColor ?? ColorManager.grey2,
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.fontFamily,
              fontSize: AppSize.s15,
            ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey2,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
        ),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
