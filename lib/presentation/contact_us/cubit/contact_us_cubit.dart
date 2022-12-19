import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/contact_us/cubit/contact_us_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  static ContactUsCubit get(BuildContext context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isSuggestion = true;
  bool isComplaint = false;

  void changeRadioButton(String type){
    if(type == 'complaint'){
      isComplaint = true;
      isSuggestion = false;
    }
    if(type == 'suggestion'){
      isComplaint = false;
      isSuggestion = true;
    }

    emit(ChangeRadioButtonStata());
  }



}
