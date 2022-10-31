import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void skipOnPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
  }

  void loginOnPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.locationRoute, (route) => false);
  }

  void forgotPasswordOnPressed(BuildContext context) {
    Navigator.pushNamed(context, Routes.forgetPasswordRoute);
  }

  void facebookOnPressed() {}

  void googleOnPressed() {}

  void registerOnPressed(BuildContext context) {
    Navigator.pushNamed(context, Routes.registerRoute);
  }
}
