import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class CategorySearchTextFieldWidget extends StatelessWidget {
  final TextEditingController searchController;

  const CategorySearchTextFieldWidget({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: AppSize.s17,
        left: AppSize.s17,
        bottom: AppSize.s19,
      ),
      width: double.infinity,
      height: AppSize.s70,
      decoration: const BoxDecoration(
        color: ColorManager.primaryLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
        ),
      ),
      child: TextFormField(
        controller: searchController,
        cursorColor: ColorManager.primary,
        validator: (value) {
          if (value!.isEmpty) {
            return StringsManager.fieldIsRequired;
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: SvgPicture.asset(
              ImageAssets.categories,
              color: ColorManager.grey3,
              width: AppSize.s28,
              height: AppSize.s28,
              fit: BoxFit.fill,
            ),
          ),
          hintText: StringsManager.search,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorManager.grey3,
                fontWeight: FontWeightManager.medium,
                fontSize: AppSize.s14,
              ),
          filled: true,
          fillColor: ColorManager.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s14),
            borderSide: const BorderSide(
              color: ColorManager.grey3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s14),
            borderSide: const BorderSide(
              color: ColorManager.primary,
            ),
          ),
        ),
      ),
    );
  }
}
