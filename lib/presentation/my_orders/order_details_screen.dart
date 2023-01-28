import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marchant/presentation/my_orders/cubit/my_orders_cubit.dart';
import 'package:marchant/presentation/my_orders/cubit/my_orders_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';
import 'package:marchant/presentation/widgets/order_details_order_item_widget.dart';
import 'package:marchant/presentation/widgets/order_progress_timeline_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

// ignore: must_be_immutable
class OrderDetailsScreen extends StatelessWidget {
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

  OrderDetailsScreen({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit(),
      child: BlocConsumer<MyOrdersCubit, MyOrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MyOrdersCubit.get(context);
            return Scaffold(
              appBar: whiteAppBarWidget(
                context: context,
                title: StringsManager.orderDetails,
                color: ColorManager.primaryMoreLight,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    children: [
                      // time and number and progress timeline
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // time and number
                          Column(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.001,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ],
                          ),

                          //progress timeline
                          OrderProgressTimelineWidget(
                            reviewingStatus: reviewingStatus,
                            preparingStatus: preparingStatus,
                            inWayStatus: inWayStatus,
                            receivingStatus: receivingStatus,
                            preparingPress: preparingPress,
                            inWayPress: inWayPress,
                            receivingPress: receivingPress,
                            reviewingPress: reviewingPress,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       DriverWidget(),

                      // money
                      Column(
                        children: [
                          Row(
                            children: [
                              //titles
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    StringsManager.deliveryFees,
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  const Text(
                                    StringsManager.total,
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  const Text(
                                    StringsManager.paymentMethod,
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),

                              // values
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // delivery fees
                                  Text(
                                    '20 EGP',
                                    style: TextStyle(
                                      color: ColorManager.primary,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),

                                  //total
                                  Text(
                                    '20 EGP',
                                    style: TextStyle(
                                      color: ColorManager.primary,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),

                                  //payment method
                                  Text(
                                    'cash',
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                       DriverWidget(),

                      //address
                      Row(
                        children: [
                          Image.asset(
                            ImageAssets.myOrderIcon,
                            color: ColorManager.greyDark,
                            height: AppSize.s20,
                            width: AppSize.s33,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  StringsManager.deliverTo,
                                  style: TextStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s15,
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                // address
                                Text(
                                  'Giza, 6 October, Area one',
                                  style: TextStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s15,
                                    fontWeight: FontWeightManager.bold,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),

                                //details
                                Text(
                                  '''4 Elhoria Street, from Gamal Street, Elsa
men October, Giza.
Floor 6 - department 12''',
                                  style: TextStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeightManager.regular,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                                ),

                                //land mark
                                Row(
                                  children: const [
                                    Text(
                                     '${ StringsManager.landMark } : ',
                                      style: TextStyle(
                                        color: ColorManager.greyDark,
                                        fontSize: AppSize.s15,
                                        fontWeight: FontWeightManager.bold,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                    Text(
                                      'Koshry eltahrir',
                                      style: TextStyle(
                                        color: ColorManager.greyDark,
                                        fontSize: AppSize.s15,
                                        fontWeight: FontWeightManager.regular,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                       DriverWidget(),

                      //order
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            StringsManager.yourOrder,
                            style: TextStyle(
                              color: ColorManager.greyDark,
                              fontSize: AppSize.s15,
                              fontWeight: FontWeightManager.bold,
                              fontFamily: FontConstants.fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>
                                OrderDetailsOrderItemWidget(
                              productImage: ImageAssets.lanshonOffer,
                              productName: 'Lasnshon Halwany',
                              productPrice: '20 EGP',
                              productQuantity: '1 KG',
                              productDescription:
                                  'Some description will be here bla bla bla bla bla bla',
                            ),
                            separatorBuilder: (context, index) =>
                                 DriverWidget(),
                            itemCount: 2,
                          ),
                        ],
                      ),

                       DriverWidget(),

                      //buyer
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            StringsManager.buyer,
                            style: TextStyle(
                              color: ColorManager.greyDark,
                              fontSize: AppSize.s15,
                              fontWeight: FontWeightManager.bold,
                              fontFamily: FontConstants.fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              // market image
                              Container(
                                height: AppSize.s59,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s15)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                  ImageAssets.muskMarket,
                                  height: AppSize.s59,
                                  width: AppSize.s72,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),

                              // market name and rate
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Musk Market',
                                    style: TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: AppSize.s15,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  RatingBar.builder(
                                    unratedColor: ColorManager.greyDark,
                                    initialRating: 4,
                                    minRating: 1,
                                    itemSize: AppSize.s16,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.zero,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_rounded,
                                      color: ColorManager.accent,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
