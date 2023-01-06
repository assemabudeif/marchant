import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class FilterPriceIndicatorWidget extends StatelessWidget {
  late RangeValues priceValues;

  late Function(RangeValues values) onChange;

  FilterPriceIndicatorWidget(
      {Key? key, required this.priceValues, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    StringsManager.from,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.greyDark,
                        fontSize: FontSizeManager.s10,
                        fontWeight: FontWeightManager.regular),
                  ),
                  const Spacer(),
                  Text(
                    StringsManager.to,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.greyDark,
                        fontSize: FontSizeManager.s10,
                        fontWeight: FontWeightManager.regular),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '100 ${StringsManager.EGP}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.greyDark,
                          fontSize: FontSizeManager.s12,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '1200 ${StringsManager.EGP}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.greyDark,
                          fontSize: FontSizeManager.s12,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        RangeSlider(
          values: priceValues,
          max: 1200,
          min: 100,
          divisions: 22,
          labels: RangeLabels(
            priceValues.start.round().toString(),
            priceValues.end.round().toString(),
          ),
          onChanged: onChange,
        ),
      ],
    );
  }
}
