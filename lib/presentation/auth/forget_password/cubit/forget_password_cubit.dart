import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  var emailController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  var forgetPasswordFormKey = GlobalKey<FormState>();
  var setNewPasswordFormKey = GlobalKey<FormState>();

  void skipOnPressed() {}

  void sendOnPressed(BuildContext context) {
    Navigator.pushNamed(context, Routes.setNewPasswordRoute);
  }

  void resetNextOnPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginRoute, (route) => false);
  }
}
