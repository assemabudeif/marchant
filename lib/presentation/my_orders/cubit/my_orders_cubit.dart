import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/my_orders/cubit/my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersInitial());

  static MyOrdersCubit get(BuildContext context) => BlocProvider.of(context);

  bool isActive = false;
  bool isPast = true;

  void changeButton(String type) {
    if (type == 'active') {
      isActive = true;
      isPast = false;
    }
    if (type == 'past') {
      isActive = false;
      isPast = true;
    }

    emit(ChangeButtonState());
  }
}
