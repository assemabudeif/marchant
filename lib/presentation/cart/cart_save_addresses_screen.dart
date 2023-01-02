import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/cart/cart_order_summary_screen.dart';
import 'package:marchant/presentation/cart/cubit/cart_cubit.dart';
import 'package:marchant/presentation/cart/cubit/cart_state.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/cart_bottom_navigation_bar_widget.dart';
import 'package:marchant/presentation/widgets/cart_progress_line_widget.dart';
import 'package:marchant/presentation/widgets/save_addresses_list_tile_item_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

enum SingingCharacter { home1, home2, home3 }

// ignore: must_be_immutable
class CartSaveAddressesScreen extends StatelessWidget {
  CartSaveAddressesScreen({Key? key}) : super(key: key);

  SingingCharacter? character = SingingCharacter.home1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CartCubit.get(context);

          return Scaffold(
            appBar: whiteAppBarWidget(
              context: context,
              title: 'Musk Market',
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '+ ${StringsManager.notes}',
                    style: TextStyle(
                      color: ColorManager.red,
                      fontSize: AppSize.s14,
                      fontWeight: FontWeightManager.regular,
                      fontFamily: FontConstants.fontFamily,
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p24),
                child: Column(
                  children: [
                    const CartProgressLineWidget(
                      pageNum: 1,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => SizedBox(
                        width: double.infinity,
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: AppSize.s15,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s15),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      horizontalTitleGap: AppPadding.none,
                                      minVerticalPadding: AppPadding.none,
                                      contentPadding: EdgeInsets.zero,
                                      title: SaveAddressesListTileItemWidget(
                                        index: index,
                                        address: 'Giza, 6 October, Area one',
                                        details:
                                            '''24 Elhoria Street, from Gamal Street, Elsamen October, Giza. \nFloor 6 - department 12 ''',
                                      ),
                                      leading: Radio<Addresses>(
                                        activeColor: ColorManager.primary,
                                        value: Addresses.values[index],
                                        groupValue: cubit.address,
                                        onChanged: (Addresses? value) {
                                          cubit.changeRadioBottom(value!);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert_rounded,
                                  color: ColorManager.greyDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: AppSize.s15,
                      ),
                      itemCount: 4,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CartBottomNavigationBarWidget(
              price: '50 EGP',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartOrderSummaryScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
