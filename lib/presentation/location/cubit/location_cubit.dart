import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  static LocationCubit get(BuildContext context) => BlocProvider.of(context);

  void skipOnPressed(BuildContext context) {}

  void shareOnPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.ads, (route) => false);
  }

  void chooseLocationManuallyOnPressed(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.chooseLocationRoute,
    );
  }

  void confirmLocationOnPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.ads, (route) => false);
  }

  void backButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
