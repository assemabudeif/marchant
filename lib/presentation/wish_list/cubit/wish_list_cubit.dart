import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/wish_list/cubit/wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  static WishListCubit get(BuildContext context) => BlocProvider.of(context);

  bool isProducts = false;
  bool isShops = true;

  void changeButton(String type) {
    if (type == 'products') {
      isProducts = true;
      isShops = false;
    }
    if (type == 'shops') {
      isProducts = false;
      isShops = true;
    }

    emit(ChangeButtonState());
  }
}
