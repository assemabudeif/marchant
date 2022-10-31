import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool agree = false;

  void onAgreeChanged(bool? value) {
    emit(RegistrationInitial());
    log(value.toString());
    agree = value!;
    emit(OnAgreeChanged());
  }

  void termsOfServicePressed() {}

  void skipButtonPressed() {}

  void registerButtonPressed() {}
}
