import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/location/cubit/location_cubit.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (BuildContext context, LocationState state) {},
        builder: (BuildContext context, LocationState state) {
          var cubit = LocationCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: TextButton(
                      onPressed: () {
                        cubit.skipOnPressed(context);
                      },
                      child: const Text(
                        StringsManager.skip,
                        style: TextStyle(
                          color: ColorManager.primaryLight,
                          fontSize: AppSize.s16,
                          fontWeight: FontWeightManager.regular,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(ImageAssets.map),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorManager.primaryMoreLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s40),
                          topRight: Radius.circular(AppSize.s40),
                        ),
                      ),
                      padding: const EdgeInsets.all(AppPadding.p24),
                      child: Column(
                        children: [
                          const Text(
                            StringsManager.shareYourLocation,
                            style: TextStyle(
                              fontSize: AppSize.s24,
                              color: ColorManager.black,
                              fontWeight: FontWeightManager.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          const Text(
                            StringsManager.shareYourLocationDescription,
                            style: TextStyle(
                              fontSize: AppSize.s14,
                              color: ColorManager.greyDark,
                              fontWeight: FontWeightManager.medium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          DefaultButtonWidget(
                            onPressed: () {
                              cubit.shareOnPressed(context);
                            },
                            text: StringsManager.yesShareMyLocation,
                            color: ColorManager.primaryLight,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.chooseLocationManuallyOnPressed(context);
                            },
                            child: const Text(
                              StringsManager.noChooseLocationManually,
                              style: TextStyle(
                                fontSize: AppSize.s16,
                                color: ColorManager.primaryLight,
                                fontWeight: FontWeightManager.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
