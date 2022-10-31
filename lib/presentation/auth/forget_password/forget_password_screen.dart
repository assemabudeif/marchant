import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/login_text_field_widget.dart';
import 'package:marchant/presentation/widgets/sliver_app_bar_widget.dart';

import 'cubit/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBarWidget(
                    onSkipButtonPressed: () {
                      cubit.skipOnPressed();
                    },
                    isBackButtonVisible: true,
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.12,
                        vertical: MediaQuery.of(context).size.height * 0.1,
                      ),
                      child: Form(
                        key: cubit.forgetPasswordFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsManager.forgetPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: ColorManager.primary,
                                  ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            LoginTextFieldWidget(
                              controller: cubit.emailController,
                              label:
                                  StringsManager.enterYourEmailToResetPassword,
                              keyboardType: TextInputType.emailAddress,
                              labelColor: ColorManager.grey2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            DefaultButtonWidget(
                              onPressed: () {
                                cubit.sendOnPressed(context);
                              },
                              text: StringsManager.send,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
