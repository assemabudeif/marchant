import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/location/cubit/location_cubit.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = LocationCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              cubit.backButtonPressed(context);
                            },
                            iconSize: AppSize.s25,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ColorManager.accent,
                            )),
                        Expanded(
                          child: TextFormField(
                            cursorColor: ColorManager.primary,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: AppPadding.p30),
                              label: const Text(StringsManager.search),
                              labelStyle: const TextStyle(
                                fontSize: AppSize.s16,
                                color: ColorManager.grey2,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10),
                                  borderSide: const BorderSide(
                                    color: ColorManager.primary,
                                    width: AppSize.s1_5,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          ImageAssets.chooseLocation,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: const BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSize.s30),
                              topRight: Radius.circular(AppSize.s30),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              cubit.confirmLocationOnPressed(context);
                            },
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s30),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  StringsManager.confirmLocation,
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
