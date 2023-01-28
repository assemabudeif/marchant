import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/contact_us/cubit/contact_us_cubit.dart';
import 'package:marchant/presentation/contact_us/cubit/contact_us_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/contact_us_dialog_widget.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';
import 'package:marchant/presentation/widgets/login_text_field_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class ContactusScreen extends StatelessWidget {
  const ContactusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ContactUsCubit.get(context);
            return Scaffold(
              appBar: whiteAppBarWidget(
                title: StringsManager.contactus,
                context: context,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p31,
                  vertical: AppPadding.p20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            //message type
                            Center(
                              child: Text(StringsManager.messageType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: AppSize.s15,
                                      )),
                            ),
                            const SizedBox(
                              height: AppSize.s16,
                            ),

                            //suggestion or complaint
                            Row(
                              children: [
                                //suggestion
                                Expanded(
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cubit.changeRadioButton(
                                                'suggestion');
                                          },
                                          icon: Icon(
                                            cubit.isSuggestion
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            size: AppSize.s30,
                                            color: cubit.isSuggestion
                                                ? ColorManager.primary
                                                : ColorManager.black,
                                          )),
                                      Text(
                                        StringsManager.suggestion,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: FontSizeManager.s14,
                                              fontWeight:
                                                  FontWeightManager.medium,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),

                                // complaint
                                Expanded(
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cubit
                                                .changeRadioButton('complaint');
                                          },
                                          icon: Icon(
                                            cubit.isComplaint
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            size: AppSize.s30,
                                            color: cubit.isComplaint
                                                ? ColorManager.primary
                                                : ColorManager.black,
                                          )),
                                      Text(
                                        StringsManager.complaint,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: FontSizeManager.s14,
                                              fontWeight:
                                                  FontWeightManager.medium,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s45,
                            ),

                            //name
                            LoginTextFieldWidget(
                              controller: cubit.nameController,
                              label: StringsManager.name,
                              keyboardType: TextInputType.name,
                              labelColor: ColorManager.grey2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //email
                            LoginTextFieldWidget(
                              controller: cubit.emailController,
                              label: StringsManager.email,
                              keyboardType: TextInputType.emailAddress,
                              labelColor: ColorManager.grey2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //message
                            LoginTextFieldWidget(
                              controller: cubit.messageController,
                              label: StringsManager.messageContent,
                              keyboardType: TextInputType.text,
                              labelColor: ColorManager.grey2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                          ],
                        ),
                        //send
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DefaultButtonWidget(
                              text: StringsManager.send,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const ContactUsDialogWidget(),
                                );
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              StringsManager.contactUsNow,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ColorManager.primary,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      ImageAssets.callIcon,
                                      height: AppSize.s34,
                                      width: AppSize.s34,
                                    )),
                                const SizedBox(
                                  width: AppSize.s25,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      ImageAssets.messageIcon,
                                      height: AppSize.s34,
                                      width: AppSize.s34,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
