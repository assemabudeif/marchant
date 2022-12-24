import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/edit_account_text_field_widget.dart';

var emailController = TextEditingController();
var nameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    passwordController.text = '123';
    nameController.text = 'Medhat Mohamed';
    phoneController.text = '01224344250';
    emailController.text = 'Medhat@yahoo.com';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryMoreLight,
        title: Text('Account Information',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorManager.primary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p31),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // profile image
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [

                    Image(
                      image: AssetImage(
                        ImageAssets.profileImage,
                      ),
                      height: AppSize.s60,
                      width: AppSize.s60,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 1.0,
                        end: 1.0,
                      ),
                      child: CircleAvatar(
                        radius: AppSize.s9,
                        backgroundColor: ColorManager.accent,
                        child: Icon(
                          Icons.add,
                          color: ColorManager.white,
                          size: 19.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppPadding.p14,
              ),

              //name
              EditAccountTextFieldWidget(
                controller: nameController,
                label: StringsManager.name,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //phone
              EditAccountTextFieldWidget(
                controller: phoneController,
                label: StringsManager.phone,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //email
              EditAccountTextFieldWidget(
                controller: emailController,
                label: StringsManager.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //password
              EditAccountTextFieldWidget(
                controller: passwordController,
                label: StringsManager.editPassword,
                keyboardType: TextInputType.text,
                isRead: true,
                isObscure: true,
                onPress: () {
                  Navigator.pushNamed(context, Routes.changePassword);
                },
                onTab: () {
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.p31),
        child: DefaultButtonWidget(
          text: StringsManager.update,
          onPressed: () {
          },
        ),
      ),
    );
  }
}
