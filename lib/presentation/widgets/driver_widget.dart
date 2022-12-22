import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';

class DriverWidget extends StatelessWidget {
  const DriverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

        Container(
          width: double.infinity,
          height: 1.0,
          color: ColorManager.grey2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

      ],
    );
  }
}
