// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

import '../resources/strings_manager.dart';

class LoginTextFieldWidget extends StatefulWidget {
  LoginTextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.labelColor = ColorManager.grey1,
    this.isPassword = false,
    this.isObscure = false,
    this.onTab,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  Color? labelColor;
  Function? onTab;
  Function(String)? onChanged;
  bool? isPassword;
  bool? isObscure;

  @override
  State<LoginTextFieldWidget> createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: widget.labelColor,
              fontWeight: FontWeightManager.medium,
              fontSize: AppSize.s14,
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
        suffixIcon: widget.isPassword!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.isObscure = !widget.isObscure!;
                  });
                },
                icon: Icon(
                  widget.isObscure! ? Icons.visibility : Icons.visibility_off,
                  color: ColorManager.grey2,
                ),
              )
            : null,
      ),
      onTap: () {
        if (widget.onTab != null) {
          widget.onTab!();
        }
      },
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      keyboardType: widget.keyboardType,
      obscureText: widget.isObscure!,
    );
  }
}
