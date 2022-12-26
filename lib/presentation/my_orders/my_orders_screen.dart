import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/my_orders/cubit/my_orders_cubit.dart';
import 'package:marchant/presentation/my_orders/cubit/my_orders_state.dart';
import 'package:marchant/presentation/my_orders/order_details_screen.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/widgets/my_orders_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

import '../resources/values_manager.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
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
              title: StringsManager.myOrders,
              color: ColorManager.primaryMoreLight,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //active
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeButton('active');
                          },
                          child: Container(
                            color: ColorManager.primaryMoreLight,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          StringsManager.active,
                                          style: TextStyle(
                                            color: cubit.isActive
                                                ? ColorManager.primary
                                                : ColorManager.grey2,
                                            fontSize: AppSize.s16,
                                            fontWeight: FontWeightManager.bold,
                                            fontFamily:
                                                FontConstants.fontFamily,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: ColorManager.accent,
                                        ))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 3.0,
                                      color: cubit.isActive
                                          ? ColorManager.primary
                                          : ColorManager.grey2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s3,
                      ),
                      // past
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeButton('past');
                          },
                          child: Container(
                            color: ColorManager.primaryMoreLight,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          StringsManager.past,
                                          style: TextStyle(
                                            color: cubit.isPast
                                                ? ColorManager.primary
                                                : ColorManager.grey4,
                                            fontSize: AppSize.s16,
                                            fontWeight: FontWeightManager.bold,
                                            fontFamily:
                                                FontConstants.fontFamily,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: ColorManager.accent,
                                        ))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 3.0,
                                      color: cubit.isPast
                                          ? ColorManager.primary
                                          : ColorManager.grey2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => MyOrdersItemWidget(
                      reviewingStatus: 'done',
                      preparingStatus: 'inProgress',
                      inWayStatus: 'rejected',
                      receivingStatus: '',
                      number: '12:00 pm',
                      dateTime: '10/12/2020',
                      showPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailsScreen(
                              reviewingStatus: 'done',
                              preparingStatus: 'inProgress',
                              inWayStatus: 'rejected',
                              receivingStatus: '',
                              number: '12:00 pm',
                              dateTime: '10/12/2020',
                              inWayPress: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: ColorManager.greyDark,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.cancel_rounded,
                                                  color: ColorManager.red,
                                                  size: AppSize.s100,
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                ),
                                                Text(
                                                  'Reject Title',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        color:
                                                            ColorManager.black,
                                                        fontSize:
                                                            FontSizeManager.s20,
                                                        fontWeight:
                                                            FontWeightManager
                                                                .bold,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                                Text(
                                                  'Reject description is here',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color:
                                                            ColorManager.grey4,
                                                        fontSize:
                                                            FontSizeManager.s16,
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: AppSize.s16,
                    ),
                    itemCount: 4,
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
