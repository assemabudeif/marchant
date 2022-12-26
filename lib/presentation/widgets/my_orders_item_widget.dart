import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/order_progress_timeline_widget.dart';

// ignore: must_be_immutable
class MyOrdersItemWidget extends StatelessWidget {
  final String reviewingStatus;
  Function()? reviewingPress;
  final String preparingStatus;
  Function()? preparingPress;
  final String inWayStatus;
  Function()? inWayPress;
  final String receivingStatus;
  Function()? receivingPress;
  final String dateTime;
  final String number;
  Function()? showPress;

  MyOrdersItemWidget({
    Key? key,
    required this.reviewingStatus,
    required this.preparingStatus,
    required this.inWayStatus,
    required this.receivingStatus,
    this.reviewingPress,
    this.preparingPress,
    this.inWayPress,
    this.receivingPress,
    required this.dateTime,
    required this.number,
    required this.showPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: SizedBox(
        height: AppSize.s170,
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: AppSize.s15,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Date / Time : $dateTime',
                      style: const TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s15,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    Text(
                      'Order Number : $number',
                      style: const TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s15,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
              OrderProgressTimelineWidget(
                reviewingStatus: 'done',
                preparingStatus: 'inProgress',
                inWayStatus: 'rejected',
                receivingStatus: '',
                preparingPress: preparingPress,
                inWayPress: inWayPress,
                receivingPress: receivingPress,
                reviewingPress: reviewingPress,
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: showPress,
                  child: Text(
                    StringsManager.showOrderDetails,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorManager.primary,
                          fontWeight: FontWeightManager.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
