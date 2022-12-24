import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/account/cubit/account_cubit.dart';
import 'package:marchant/presentation/account/cubit/account_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/account_banner_widget.dart';
import 'package:marchant/presentation/widgets/account_item_widget.dart';
import 'package:marchant/presentation/widgets/driver_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AccountCubit(),
        child: BlocConsumer<AccountCubit, AccountState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AccountCubit.get(context);
              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //profile data
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: AppSize.s15,
                            ),
                            Image(
                              image: AssetImage(
                                ImageAssets.profileImage,
                              ),
                              height: 65,
                              width: 65,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: AppSize.s7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.accountInformation);
                                  },
                                  child: Image.asset(
                                    ImageAssets.editIcon,
                                    height: AppSize.s18,
                                    width: AppSize.s18,
                                    color: ColorManager.greyDark,
                                  ),
                                ),
                                const SizedBox(
                                  width: AppSize.s8,
                                ),
                                Text(
                                  'Medhat Mohamed',
                                  style: TextStyle(
                                    color: ColorManager.primaryLight,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            Text(
                              '01224344250',
                              style: TextStyle(
                                color: ColorManager.greyDark,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            DriverWidget(),
                          ],
                        ),
                        //My Account
                        AccountBannerWidget(
                          text: StringsManager.myAccount,
                          onPressed: () {
                            cubit.changeRadioButton('account');
                          },
                          isPressed: cubit.isMyAccount,
                        ),
                        const SizedBox(
                          height: AppSize.s17,
                        ),
                        if (cubit.isMyAccount)
                          Column(
                            children: [
                              //wish List
                              AccountItemWidget(
                                text: StringsManager.wishList,
                                image: ImageAssets.heartIcon,
                                onTap: () {},
                              ),

                              //my orders
                              AccountItemWidget(
                                text: StringsManager.myOrders,
                                image: ImageAssets.myOrderIcon,
                                onTap: () {},
                              ),

                              //saved Addresses
                              AccountItemWidget(
                                text: StringsManager.savedAddresses,
                                image: ImageAssets.addressesIcon,
                                onTap: () {},
                              ),
                            ],
                          ),

                        //settings
                        AccountBannerWidget(
                          text: StringsManager.settings,
                          onPressed: () {
                            cubit.changeRadioButton('settings');
                          },
                          isPressed: cubit.isSettings,
                        ),
                        const SizedBox(
                          height: AppSize.s17,
                        ),
                        if (cubit.isSettings)
                          Column(
                            children: [
                              //Language
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p30),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: AppSize.s44,
                                        child: Image.asset(
                                          ImageAssets.languageIcon,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: AppSize.s25,
                                      ),
                                      const Text(
                                        StringsManager.language,
                                        style: TextStyle(
                                          color: ColorManager.greyDark,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'English',
                                        style: TextStyle(
                                          color: ColorManager.greyDark,
                                          fontSize: AppSize.s15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Payment
                              AccountItemWidget(
                                text: StringsManager.payment,
                                image: ImageAssets.creditIcon,
                                onTap: () {},
                              ),

                              //Notifications
                              AccountItemWidget(
                                text: StringsManager.notifications,
                                image: ImageAssets.notificationIcon,
                                onTap: () {},
                              ),
                            ],
                          ),

                        //3alnassya
                        Container(
                          height: AppSize.s45,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            right: AppPadding.p20,
                            left: AppPadding.p30,
                          ),
                          color: ColorManager.primaryMoreLight,
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssets.alnassyaIcon,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  cubit.changeRadioButton('3alnassya');
                                },
                                icon: Icon(
                                    cubit.isAlnassya
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_outlined,
                                    color: ColorManager.accent),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s17,
                        ),
                        if (cubit.isAlnassya)
                          Column(
                            children: [
                              //about app
                              AccountItemWidget(
                                text: StringsManager.aboutApplication,
                                image: ImageAssets.aboutIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.about);
                                },
                              ),

                              //privacy
                              AccountItemWidget(
                                text: StringsManager.privacyPolicy,
                                image: ImageAssets.privacyIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.policy);
                                },
                              ),

                              //terms
                              AccountItemWidget(
                                text: StringsManager.termsAndConditions,
                                image: ImageAssets.termsIcon,
                                onTap: () {},
                              ),

                              //call us
                              AccountItemWidget(
                                text: StringsManager.callUs,
                                image: ImageAssets.phoneIcon,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.contactUs);
                                },
                              ),

                              //facebook
                              AccountItemWidget(
                                text: StringsManager.facebook,
                                image: ImageAssets.facebookIcon,
                                onTap: () {},
                              ),

                              //twitter
                              AccountItemWidget(
                                text: StringsManager.twitter,
                                image: ImageAssets.addressesIcon,
                                onTap: () {},
                              ),

                              //instagram
                              AccountItemWidget(
                                text: StringsManager.instagram,
                                image: ImageAssets.instagramIcon,
                                onTap: () {},
                              ),

                              //share App With Friends
                              AccountItemWidget(
                                text: StringsManager.shareAppWithFriends,
                                image: ImageAssets.shareIcon,
                                onTap: () {},
                              ),

                              //rate Application
                              AccountItemWidget(
                                text: StringsManager.rateApplication,
                                image: ImageAssets.starIcon,
                                onTap: () {},
                              ),

                              //help
                              AccountItemWidget(
                                text: StringsManager.helpFAQ,
                                image: ImageAssets.helpIcon,
                                onTap: () {},
                              ),

                              //legal
                              AccountItemWidget(
                                text: StringsManager.legal,
                                image: ImageAssets.legalIcon,
                                onTap: () {},
                              ),

                              //log out
                              AccountItemWidget(
                                text: StringsManager.logOut,
                                image: ImageAssets.logoutIcon,
                                onTap: () {},
                              ),
                            ],
                          ),

                        const Text(
                          'جميع الحقوق محفوظة لشركة اون كوميرس',
                          style: TextStyle(
                            color: ColorManager.greyDark,
                            fontSize: AppSize.s15,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s26,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
