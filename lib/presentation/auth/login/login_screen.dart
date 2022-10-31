import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/auth/login/cubit/login_cubit.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/login_text_field_widget.dart';
import 'package:marchant/presentation/widgets/sliver_app_bar_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBarWidget(
                    isBackButtonVisible: false,
                    onSkipButtonPressed: () {
                      cubit.skipOnPressed(context);
                    },
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.1),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsManager.login,
                                  style:
                                      Theme.of(context).textTheme.titleMedium!,
                                ),
                                const SizedBox(height: AppSize.s18),
                                LoginTextFieldWidget(
                                  controller: cubit.emailController,
                                  label: StringsManager.email,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: AppSize.s18),
                                LoginTextFieldWidget(
                                  controller: cubit.passwordController,
                                  label: StringsManager.password,
                                  keyboardType: TextInputType.visiblePassword,
                                  isPassword: true,
                                  isObscure: true,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      cubit.forgotPasswordOnPressed(context);
                                    },
                                    child: Text(
                                      StringsManager.forgotPassword,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: ColorManager.primaryLight,
                                            fontWeight: FontWeightManager.bold,
                                            fontSize: FontSizeManager.s17,
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSize.s10),
                                DefaultButtonWidget(
                                  text: StringsManager.login,
                                  onPressed: () {
                                    cubit.loginOnPressed(context);
                                  },
                                ),
                                const SizedBox(height: AppSize.s12),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        color: ColorManager.greyDark,
                                        thickness: 1,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: AppSize.s10,
                                      ),
                                      child: Text(
                                        StringsManager.or,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: ColorManager.grey3,
                                              fontWeight:
                                                  FontWeightManager.bold,
                                              fontSize: FontSizeManager.s16,
                                            ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Divider(
                                        color: ColorManager.greyDark,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSize.s12),
                                DefaultButtonWidget(
                                  onPressed: () {
                                    cubit.facebookOnPressed();
                                  },
                                  color: ColorManager.facebook,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorManager.white,
                                        radius: AppSize.s10,
                                        child: SvgPicture.asset(
                                          ImageAssets.facebook,
                                          height: AppSize.s14,
                                        ),
                                      ),
                                      const SizedBox(width: AppSize.s14),
                                      Text(
                                        StringsManager.connectWithFacebook,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: ColorManager.white,
                                              fontWeight:
                                                  FontWeightManager.bold,
                                              fontSize: FontSizeManager.s16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSize.s12),
                                DefaultButtonWidget(
                                  onPressed: () {
                                    cubit.googleOnPressed();
                                  },
                                  color: ColorManager.google,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorManager.white,
                                        radius: AppSize.s10,
                                        child: SvgPicture.asset(
                                          ImageAssets.google,
                                          color: ColorManager.google,
                                          height: AppSize.s14,
                                        ),
                                      ),
                                      const SizedBox(width: AppSize.s22),
                                      Text(
                                        StringsManager.connectWithGoogle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: ColorManager.white,
                                              fontWeight:
                                                  FontWeightManager.bold,
                                              fontSize: FontSizeManager.s16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSize.s20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      StringsManager.dontHaveAccount,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: ColorManager.grey3,
                                            fontWeight: FontWeightManager.bold,
                                            fontSize: FontSizeManager.s14,
                                          ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cubit.registerOnPressed(context);
                                      },
                                      child: Text(
                                        StringsManager.createNewAccount,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: ColorManager.primaryLight,
                                              fontWeight:
                                                  FontWeightManager.bold,
                                              fontSize: FontSizeManager.s14,
                                            ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
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
