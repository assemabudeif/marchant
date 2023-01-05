import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class OrderProgressTimelineWidget extends StatelessWidget {
  final String reviewingStatus;
  Function()? reviewingPress;
  final String preparingStatus;
  Function()? preparingPress;
  final String inWayStatus;
  Function()? inWayPress;
  final String receivingStatus;
  Function() ?receivingPress;

  OrderProgressTimelineWidget(
      {Key? key,
      required this.reviewingStatus,
      required this.preparingStatus,
      required this.inWayStatus,
      required this.receivingStatus,
       this.reviewingPress,
       this.preparingPress,
       this.inWayPress,
       this.receivingPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: Row(
            children: [
              InkWell(
                onTap: reviewingPress,
                child: progressIcon(
                  reviewingStatus,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: ColorManager.grey2,
                ),
              ),
              InkWell(
                onTap: preparingPress,
                child: progressIcon(
                  preparingStatus,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: ColorManager.grey2,
                ),
              ),

              InkWell(
                onTap: inWayPress,
                child: progressIcon(
                  inWayStatus,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: ColorManager.grey2,
                ),
              ),
              InkWell(
                onTap: receivingPress,
                child: progressIcon(
                  receivingStatus,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),

        Row(
          children: [
            Expanded(
              child: Text(
                StringsManager.reviewing,
                style: TextStyle(
                  color: reviewingStatus == 'rejected'
                      ? ColorManager.red
                      : ColorManager.greyDark,
                  fontSize: AppSize.s12,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
            ),
            Expanded(
              child: Text(
                StringsManager.preparing,
                style: TextStyle(
                  color: preparingStatus == 'rejected'
                      ? ColorManager.red
                      : ColorManager.greyDark,
                  fontSize: AppSize.s12,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                StringsManager.inWay,
                style: TextStyle(
                  color: inWayStatus == 'rejected'
                      ? ColorManager.red
                      : ColorManager.greyDark,
                  fontSize: AppSize.s12,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                StringsManager.receiving,
                style: TextStyle(
                  color: receivingStatus == 'rejected'
                      ? ColorManager.red
                      : ColorManager.greyDark,
                  fontSize: AppSize.s12,
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.fontFamily,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget progressIcon(String type) {
  if (type == 'rejected') {
    return const Icon(
      Icons.cancel,
      color: ColorManager.red,
    );
  }
  if (type == 'done') {
    return const Icon(
      Icons.check_circle,
      color: ColorManager.primary,
    );
  }
  if (type == 'inProgress') {
    return const Icon(
      Icons.circle_outlined,
      color: ColorManager.primary,
    );
  } else {
    return const Icon(
      Icons.circle_rounded,
      color: ColorManager.grey2,
    );
  }
}
