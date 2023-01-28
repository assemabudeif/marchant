import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';

class DriverWidget extends StatelessWidget {
  double? topSize;
  double? bottomSize;
  double? height;
  Color? color;

  DriverWidget({Key? key, this.bottomSize, this.topSize, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: topSize ?? MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          width: double.infinity,
          height: height ?? 1.0,
          color: color?? ColorManager.grey2,
        ),
        SizedBox(
          height: bottomSize ?? MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
