import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class ContactUsDialogWidget extends StatelessWidget {
  const ContactUsDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.smilyFaceIcon,
                      height: AppSize.s67,
                      width: AppSize.s67,
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    ),
                    Text(
                      StringsManager
                          .thankYouForContactUs,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        color:
                        ColorManager.black,
                        fontSize:
                        FontSizeManager.s18,
                        fontWeight:
                        FontWeightManager
                            .bold,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s22,
                    ),
                    Text(
                      StringsManager
                          .messageWillSendToYourEmail,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                        color:
                        ColorManager.grey4,
                        fontSize:
                        FontSizeManager.s14,
                        fontWeight:
                        FontWeightManager
                            .medium,
                      ),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      );
  }
}
