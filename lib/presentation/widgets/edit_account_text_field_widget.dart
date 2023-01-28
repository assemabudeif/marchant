// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

import '../resources/strings_manager.dart';

class EditAccountTextFieldWidget extends StatefulWidget {
  EditAccountTextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.labelColor = ColorManager.grey4,
    this.isObscure = false,
    this.isRead = false,
    this.onPress,
    this.onTab,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  Color? labelColor;
  Function? onPress;
  Function? onTab;
  bool? isObscure;
  bool? isRead;

  @override
  State<EditAccountTextFieldWidget> createState() =>
      _EditAccountTextFieldWidgetState();
}

class _EditAccountTextFieldWidgetState
    extends State<EditAccountTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ColorManager.black,
            fontSize: AppSize.s15,
          ),
      cursorColor: ColorManager.primary,
      validator: (value) {
        if (value!.isEmpty) {
          return StringsManager.fieldIsRequired;
        }
        return null;
      },
      readOnly: widget.isRead!,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: widget.labelColor,
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
          suffixIcon: IconButton(
            onPressed: () {
              if (widget.onPress != null) {
                widget.onPress!();
              }
            },
            icon: SvgPicture.asset(
              ImageAssets.editIcon,
              height: AppSize.s18,
              width: AppSize.s18,
            ),
          )),
      keyboardType: widget.keyboardType,
      obscureText: widget.isObscure!,
      obscuringCharacter: '-',
      onTap: () {
        if (widget.onTab != null) {
          widget.onTab!();
        }
      },
    );
  }
}
