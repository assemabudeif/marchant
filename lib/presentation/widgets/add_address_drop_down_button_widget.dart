import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';

// ignore: must_be_immutable
class AddAddressDropDownButtonWidget extends StatelessWidget {
  final List<String> items;
  final String item;
  Function(String?)? onChange;

  AddAddressDropDownButtonWidget(
      {Key? key,
      required this.items,
      required this.item,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: DriverWidget(
        topSize: 0.0,
        bottomSize: 0.0,
      ),
      isExpanded: true,
      value: item,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: ColorManager.accent,
      ),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: FontSizeManager.s16, color: ColorManager.grey5),
          ),
        );
      }).toList(),
      onChanged: onChange,
    );
  }
}
