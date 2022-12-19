import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/account/cubit/account_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  static AccountCubit get(BuildContext context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isMyAccount = true;
  bool isSettings = true;
  bool isalnassya = true;

  void changeRadioButton(String type){
    if(type == 'settings'){
      isSettings = !isSettings;
    }
    if(type == 'account'){
      isMyAccount = !isMyAccount;
    }
    if(type == '3alnassya'){
      isalnassya = !isalnassya;
    }
    emit(ChangeBannerButtonStata());
  }



}
