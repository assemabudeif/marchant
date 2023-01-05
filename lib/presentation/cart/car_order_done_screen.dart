import 'package:flutter/material.dart';
import 'package:marchant/presentation/home/home_screen.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/cart_progress_line_widget.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class CarOrderDoneScreen extends StatelessWidget {
  const CarOrderDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBarWidget(context: context, title: 'Musk Market'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p22, vertical: AppPadding.p8),
          child: Column(
            children: [
              const CartProgressLineWidget(
                pageNum: 3,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              Column(
                children: [
                  // thank you
                  const Text(
                    StringsManager.thankYou,
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: FontSizeManager.s30,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  // done icon
                  const Icon(
                    Icons.check_circle,
                    color: ColorManager.greenDark,
                    size: AppSize.s100,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  //your Order Send Successfully
                  const Text(
                    StringsManager.yourOrderSendSuccessfully,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: FontSizeManager.s23,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  // Order No
                  const Text(
                    '${StringsManager.orderNo}DC-46234823',
                    style: TextStyle(
                      color: ColorManager.grey4,
                      fontSize: FontSizeManager.s18,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  // next order
                  DefaultButtonWidget(
                    onPressed: () {},
                    text: StringsManager.nextOrder,
                    radius: AppSize.s24,
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),

                  //continue Shopping
                  DefaultButtonWidget(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (rout) {
                          return false;
                        },
                      );
                    },
                    text: StringsManager.continueShopping,
                    radius: AppSize.s24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
