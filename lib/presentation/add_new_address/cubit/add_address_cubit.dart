import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/add_new_address/cubit/add_address_state.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());

  static AddAddressCubit get(BuildContext context) => BlocProvider.of(context);

  String addressTitle = StringsManager.addressTitle;
  var addressTitleItems = [
    StringsManager.addressTitle,
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String city = StringsManager.city;
  var cityItems = [
    StringsManager.city,
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String area = StringsManager.area;
  var areaItems = [
    StringsManager.area,
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var addressNameController = TextEditingController();
  var areaOrStreetController = TextEditingController();
  var homeOrBuildingNumberController = TextEditingController();
  var floorDepartmentController = TextEditingController();
  var receiverNameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var landMarkController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}
