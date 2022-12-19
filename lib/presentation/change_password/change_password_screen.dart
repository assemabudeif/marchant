import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/login_text_field_widget.dart';
import 'package:marchant/presentation/widgets/sliver_app_bar_widget.dart';

var oldPasswordController = TextEditingController();
var newPasswordController = TextEditingController();
var confirmPasswordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBarWidget(
              onSkipButtonPressed: () {},
              isSkipButtonVisible: false,
              isBackButtonVisible: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(AppPadding.p31),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.editPassword,
                        style:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(height: AppSize.s18),
                      LoginTextFieldWidget(
                        controller: oldPasswordController,
                        label: StringsManager.enterOldPassword,
                        keyboardType: TextInputType.visiblePassword,
                        labelColor: ColorManager.grey4,
                        isPassword: true,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      LoginTextFieldWidget(
                        controller: newPasswordController,
                        label: StringsManager.enterNewPassword,
                        keyboardType: TextInputType.visiblePassword,
                        labelColor: ColorManager.grey4,
                        isObscure: true,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      LoginTextFieldWidget(
                        controller: confirmPasswordController,
                        label: StringsManager.confirmNewPassword,
                        keyboardType: TextInputType.visiblePassword,
                        labelColor: ColorManager.grey4,
                        isObscure: true,
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ),
            ])),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p31, vertical: AppPadding.p20),
        child: DefaultButtonWidget(
          text: StringsManager.save,
          onPressed: () {},
        ),
      ),
    );
  }
}
