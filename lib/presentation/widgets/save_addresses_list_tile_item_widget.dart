import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';

class SaveAddressesListTileItemWidget extends StatelessWidget {
  final int index;
  final String address;
  final String details;

  const SaveAddressesListTileItemWidget(
      {Key? key,
      required this.index,
      required this.address,
      required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: AppPadding.p24, bottom: AppPadding.p10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${StringsManager.home} ${index + 1}',
            style: const TextStyle(
              color: ColorManager.primary,
              fontSize: FontSizeManager.s16,
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            address,
            style: const TextStyle(
              color: ColorManager.primary,
              fontSize: FontSizeManager.s14,
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Wrap(
            children: [
              Text(
                details,
                style: const TextStyle(
                  color: ColorManager.greyDark,
                  fontSize: FontSizeManager.s14,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
