import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/auth/register/cubit/registration_cubit.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/login_text_field_widget.dart';
import 'package:marchant/presentation/widgets/sliver_app_bar_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = RegistrationCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBarWidget(
                    isBackButtonVisible: true,
                    onSkipButtonPressed: () {
                      cubit.skipButtonPressed();
                    },
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.1),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                StringsManager.createNewAccount,
                                style: TextStyle(
                                  fontSize: AppSize.s20,
                                  color: ColorManager.primary,
                                  fontWeight: FontWeightManager.bold,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.028,
                              ),
                              const Text(
                                StringsManager.enterYourPersonalInformation,
                                style: TextStyle(
                                  fontSize: AppSize.s15,
                                  color: ColorManager.grey3,
                                  fontWeight: FontWeightManager.bold,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              LoginTextFieldWidget(
                                controller: cubit.nameController,
                                label: StringsManager.enterYourName,
                                keyboardType: TextInputType.name,
                                labelColor: ColorManager.grey3,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              LoginTextFieldWidget(
                                controller: cubit.emailController,
                                label: StringsManager.enterYourEmail,
                                keyboardType: TextInputType.emailAddress,
                                labelColor: ColorManager.grey3,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              LoginTextFieldWidget(
                                controller: cubit.mobileController,
                                label: StringsManager.enterYourMobile,
                                keyboardType: TextInputType.phone,
                                labelColor: ColorManager.grey3,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              LoginTextFieldWidget(
                                controller: cubit.passwordController,
                                label: StringsManager.enterYourPassword,
                                keyboardType: TextInputType.visiblePassword,
                                labelColor: ColorManager.grey3,
                                isObscure: true,
                                isPassword: true,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              LoginTextFieldWidget(
                                controller: cubit.confirmPasswordController,
                                label: StringsManager.confirmPassword,
                                keyboardType: TextInputType.visiblePassword,
                                labelColor: ColorManager.grey3,
                                isObscure: true,
                                isPassword: true,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: cubit.agree,
                                    onChanged: (value) {
                                      cubit.onAgreeChanged(value);
                                    },
                                    activeColor: ColorManager.primary,
                                  ),
                                  const Text(
                                    StringsManager.iAgreeOfThe,
                                    style: TextStyle(
                                      fontSize: AppSize.s15,
                                      color: ColorManager.grey3,
                                      fontWeight: FontWeightManager.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      cubit.termsOfServicePressed();
                                    },
                                    child: const Text(
                                      StringsManager.termsOfService,
                                      style: TextStyle(
                                        fontSize: AppSize.s15,
                                        color: ColorManager.primary,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              DefaultButtonWidget(
                                onPressed: () {
                                  cubit.registerButtonPressed();
                                },
                                text: StringsManager.signUp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
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
