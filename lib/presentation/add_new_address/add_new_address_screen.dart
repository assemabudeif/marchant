import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/add_new_address/cubit/add_address_cubit.dart';
import 'package:marchant/presentation/add_new_address/cubit/add_address_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/add_address_drop_down_button_widget.dart';
import 'package:marchant/presentation/widgets/add_address_text_field_widget.dart';
import 'package:marchant/presentation/widgets/default_button_widget.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressCubit(),
      child: BlocConsumer<AddAddressCubit, AddAddressState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AddAddressCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorManager.primaryMoreLight,
              centerTitle: true,
              title: Text(
                StringsManager.addNewAddress,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.primary,
                    ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppMargin.m20, vertical: AppMargin.m8),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //map
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: AppSize.s15,
                          color: ColorManager.white,
                          margin: const EdgeInsets.all(AppMargin.none),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s19),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              ImageAssets.egyptMap,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s15,
                      ),

                      //address Title
                      AddAddressDropDownButtonWidget(
                        item: cubit.addressTitle,
                        items: cubit.addressTitleItems,
                        onChange: (String? newValue) {
                          setState(() {
                            cubit.addressTitle = newValue!;
                          });
                        },
                      ),

                      //city
                      AddAddressDropDownButtonWidget(
                        item: cubit.city,
                        items: cubit.cityItems,
                        onChange: (String? newValue) {
                          setState(() {
                            cubit.city = newValue!;
                          });
                        },
                      ),

                      //area
                      AddAddressDropDownButtonWidget(
                        item: cubit.area,
                        items: cubit.areaItems,
                        onChange: (String? newValue) {
                          setState(() {
                            cubit.area = newValue!;
                          });
                        },
                      ),

                      //address Name
                      const Text(
                        StringsManager.addressName,
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSizeManager.s10,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily),
                      ),

                      //address Name Will Be Here
                      AddAddressTextFieldWidget(
                        controller: cubit.addressNameController,
                        hintColor: ColorManager.greyDark,
                        hint: StringsManager.addressNameWillBeHere,
                      ),

                      //area Or Street
                      AddAddressTextFieldWidget(
                        controller: cubit.areaOrStreetController,
                        hint: StringsManager.areaOrStreet,
                      ),

                      //floor Department
                      AddAddressTextFieldWidget(
                        controller: cubit.floorDepartmentController,
                        hint: StringsManager.floorDepartment,
                      ),

                      //receiver Name
                      AddAddressTextFieldWidget(
                        controller: cubit.receiverNameController,
                        hint: StringsManager.receiverName,
                      ),

                      //mobile Number
                      AddAddressTextFieldWidget(
                        controller: cubit.mobileNumberController,
                        hint: StringsManager.mobileNumber,
                      ),

                      //land Mark
                      AddAddressTextFieldWidget(
                        controller: cubit.landMarkController,
                        hint: StringsManager.landMark,
                      ),

                     // const SizedBox(height: AppSize.s30,),

                      //save
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p17),
                        child: DefaultButtonWidget(onPressed: (){},text: StringsManager.save,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
